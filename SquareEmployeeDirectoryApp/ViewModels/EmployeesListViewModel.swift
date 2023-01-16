//
//  EmployeesListViewModel.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import Foundation
import Combine

class EmployeesListViewModel : ObservableObject {

    // Published variable to hold the employees array
    @Published  var employees : [EmployeeModel] = []
    var cancellables = Set<AnyCancellable>()
    //Instance of the data service
    let dataService = EmployeeModelDataService.instance
    
    init(){
        addSubscribers()
    }
    
    //subcribing to the employeesModel data service variable to use it in the View
    func addSubscribers(){
        dataService.$employeesModel
            .sink { [weak self] returnedEmployeeModel in
                self?.employees = returnedEmployeeModel
            }
            .store(in: &cancellables)
    }
}
