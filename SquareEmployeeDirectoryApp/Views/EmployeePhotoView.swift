//
//  EmployeePhotoView.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import SwiftUI

struct EmployeePhotoView: View {
    
    @StateObject var photoLoader : EmployeePhotoViewModel
    
    // Initializer that accepts url and key as parameters
    init(url : String, key: String){
        // Initializing the StateObject variable with the view model instance
        _photoLoader = StateObject(wrappedValue: EmployeePhotoViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            // If the photo is currently loading
            if photoLoader.isLoading{
                // Show a progress view
                ProgressView()
            } else if let photo = photoLoader.employeePhoto{
                // If photo is loaded, show the image
                Image(uiImage: photo)
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width:75, height:75)
                    .cornerRadius(8)
            }
        }
    }
}
struct EmployeePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeePhotoView(url: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", key: "1")
    }
}
