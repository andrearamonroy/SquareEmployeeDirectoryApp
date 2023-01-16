//
//  EmployeesModel_Tests.swift
//  SquareEmployeeDirectoryApp_Tests
//
//  Created by Andrea Monroy on 1/14/23.
//

import XCTest
@testable import SquareEmployeeDirectoryApp

final class EmployeesModel_Tests: XCTestCase {
    
    
    // MARK: - Properties
    var sutDirectoryModel: DirectoryModel!
    var sutEmployeeModel: EmployeeModel!
    var sutEmployeeClassification: EmployeeClassification!
    // MARK: - Set Up
    override func setUp() {
        super.setUp()
        let testEmployee1 = EmployeeModel(id:  "1", fullName:  "Justine Mason", photoURLSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", team: "Point of Sale")
        let testEmployee2 = EmployeeModel(id: "2", fullName: "Camille Rogers", photoURLSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/small.jpg", team:  "Public Web & Marketing")
        sutDirectoryModel = DirectoryModel(employees: [testEmployee1, testEmployee2])
        sutEmployeeModel = EmployeeModel(id: "1", fullName: "Justine Mason", photoURLSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", team: "Point of Sale")
        sutEmployeeClassification = EmployeeClassification.fullTime
    }
    // MARK: - Tear Down
    override func tearDown() {
        sutDirectoryModel = nil
        sutEmployeeModel = nil
        sutEmployeeClassification = nil
        super.tearDown()
    }
    // MARK: - test Directory Model
    func testDirectoryModel() {
        // Assert that the directory model contains the test employees
        XCTAssertEqual(sutDirectoryModel.employees.count, 2)
        XCTAssertEqual(sutDirectoryModel.employees[0].id, "1")
        XCTAssertEqual(sutDirectoryModel.employees[0].fullName, "Justine Mason")
        XCTAssertEqual(sutDirectoryModel.employees[0].photoURLSmall, "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg")
        XCTAssertEqual(sutDirectoryModel.employees[0].team, "Point of Sale")
        
        //Assert the codable
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let encoded = try encoder.encode(sutDirectoryModel)
            let decoded = try decoder.decode(DirectoryModel.self, from: encoded)
            XCTAssertEqual(sutDirectoryModel.employees, decoded.employees)
        } catch {
            XCTFail("Encoding or decoding failed with error: \(error)")
        }
    }
    // MARK: - test Employee Model
    func testEmployeeModel() {
        // Assert the properties of the employee model
        XCTAssertEqual(sutEmployeeModel.id, "1")
        XCTAssertEqual(sutEmployeeModel.fullName, "Justine Mason")
        XCTAssertEqual(sutEmployeeModel.photoURLSmall, "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg")
        XCTAssertEqual(sutEmployeeModel.team, "Point of Sale")
        
        //Assert the codable
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let encoded = try encoder.encode(sutEmployeeModel)
            let decoded = try decoder.decode(EmployeeModel.self, from: encoded)
            XCTAssertEqual(sutEmployeeModel.id, decoded.id)
            XCTAssertEqual(sutEmployeeModel.fullName, decoded.fullName)
            XCTAssertEqual(sutEmployeeModel.photoURLSmall, decoded.photoURLSmall)
            XCTAssertEqual(sutEmployeeModel.team, decoded.team)
        } catch {
            XCTFail("Encoding or decoding failed with error: \(error)")
        }
        
    }
}
