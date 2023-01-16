//
//  EmployeesModel.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import Foundation

// MARK: - Directory Model
struct DirectoryModel : Codable, Hashable {
    let employees : [EmployeeModel]
}
// MARK: - Employee Model
struct EmployeeModel : Identifiable, Codable, Hashable {

    let id : String
    let fullName : String
    let photoURLSmall : String
    let team : String
 
    
    enum CodingKeys : String, CodingKey {
        case team
        case id = "uuid"
        case fullName = "full_name"
        case photoURLSmall = "photo_url_small"
    }
}

enum EmployeeClassification {
    case fullTime
    case partTime
    case contractor
    
    enum CodingKeys : String, CodingKey {
        case fullTime = "FULL-TIME"
        case partTime = "PART-TIME"
        case contractor = "CONTRACTOR" }
}
