//
//  EmployeeModelDataService.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import Foundation
import Combine
import SwiftUI


class EmployeeModelDataService {
    
    static let instance = EmployeeModelDataService() //singleton
    @Published  var employeesModel : [EmployeeModel] = []
    var cancellables = Set<AnyCancellable>()
    
    //URL Endpoints: employees, employeesMalformed and employeesEmpty
    var endpoint: String = Endpoints.employees
    
    //private init, cannot be initialized again elsewhere
    private init () {
        downloadData()
    }
    
    // MARK: - donwnloadData
    func downloadData() {
        
        guard let url = URL(string: endpoint) else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background)) //subscribe on background thread
            .receive(on: DispatchQueue.main) //received on main thread
            .tryMap(handleOutput)
            .decode(type: DirectoryModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print("there was an error downloading data. \(error)")
                }
            } receiveValue: { [weak self] retunedEmployees in //weak self since self makes a strong reference
                guard let self = self else {return}
                    self.employeesModel = retunedEmployees.employees
            }
            .store(in: &cancellables)
    }
 
    // MARK: - handleOutput .tryMap
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
