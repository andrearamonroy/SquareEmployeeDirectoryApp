//
//  EmployeesListViewModel_Test.swift
//  SquareEmployeeDirectoryApp_Tests
//
//  Created by Andrea Monroy on 1/14/23.
//

import XCTest
@testable import SquareEmployeeDirectoryApp
import Combine

final class EmployeesListViewModel_Test: XCTestCase {

    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func test_EmployeesListViewModel_employess_shouldBeEmpty(){
        
        //when
        let vm = EmployeesListViewModel()
        
        //then
        XCTAssert(vm.employees.isEmpty)
    }
    
    func test_EmployeesListViewModel_addSubscribers_shouldAddSubscribers(){
        
        //given
        let vm = EmployeesListViewModel()
        //when
        let expectation =   XCTestExpectation(description: "should give employees after 3 secs")
        
        vm.$employees
            .dropFirst()
            .sink { returnedEmployees in
                expectation.fulfill()
            }
            .store(in: &cancellables)
    
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.employees.count, 0)
    }

}
