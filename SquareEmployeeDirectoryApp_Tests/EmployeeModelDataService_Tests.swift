//
//  EmployeeModelDataService_Tests.swift
//  SquareEmployeeDirectoryApp_Tests
//
//  Created by Andrea Monroy on 1/14/23.
//

import XCTest
@testable import SquareEmployeeDirectoryApp
import Combine

final class EmployeeModelDataService_Tests: XCTestCase {

    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test__downloadData_doesReturnValues_init_doesSetValuesCorrectly(){
        //given
        let _: [String]? = nil
      
        
        //when
        let dataService = EmployeeModelDataService.instance
        //then
        XCTAssertTrue(dataService.employeesModel.isEmpty)
    }
    

}
