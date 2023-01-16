//
//  EmployeesListView.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import SwiftUI

struct EmployeesListView: View {
 
    @StateObject var vm = EmployeesListViewModel()
    // track if the list is currently refreshing
    @State var isRefreshing: Bool = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(vm.employees, id: \.id){employee in
                    // Checking if the employee object is not nil
                    if let employee = employee {
                        HStack{
                            EmployeePhotoView(url: employee.photoURLSmall, key: "\(employee.id)") //makes the INT a String
                            VStack(alignment: .leading){
                                Text(employee.fullName)
                                    .font(.headline)
                                Text("Team: \(employee.team)")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                        }
                    } else {
                        //JSON is empty or malformed
                        EmptyView()
                    }
                }
                
            }
            .refreshable {
                // refresh the list
                vm.dataService.downloadData()
            }
            .navigationTitle("Employee Directory")
        }
    }
}
