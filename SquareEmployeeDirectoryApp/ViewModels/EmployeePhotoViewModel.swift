//
//  EmployeePhotoViewModel.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import Foundation
import SwiftUI
import Combine


class EmployeePhotoViewModel : ObservableObject {
    
    @Published var employeePhoto: UIImage? = nil
    //isLoading var for photo is currently being loaded
    @Published var isLoading: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    // Instance of the PhotoModelCacheManager class
    let manager = PhotoModelCacheManager.instance

    let urlString: String
    let photoKey: String
    
    init(url: String, key: String){
        urlString = url
        photoKey = key
        downloadPhoto()
    }
    
    // Method that checks if the photo is already saved in the cache, and if so, sets the employeePhoto property to that saved photo
     // If the photo is not saved, calls the downloadPhoto method
    func getPhoto(){
        if let savedPhoto = manager.get(key: photoKey) {
            employeePhoto = savedPhoto
            print("photo was saved")
        } else {
            downloadPhoto()
            print("downloading photo")
        }
    }
    
    // Method that downloads the photo from the specified URL and sets the employeePhoto property to the downloaded image
    func downloadPhoto(){
        
        isLoading = true
        
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data)
            }
           
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedPhoto in
                guard
                    let self = self,
                    let employeePhoto = returnedPhoto else {return}
                
                self.employeePhoto = returnedPhoto
                self.manager.add(key: self.photoKey, value: employeePhoto)
            }
            .store(in: &cancellables)
    }
}
