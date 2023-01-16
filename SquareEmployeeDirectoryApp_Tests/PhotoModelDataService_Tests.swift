//
//  PhotoModelDataService_Tests.swift
//  SquareEmployeeDirectoryApp_Tests
//
//  Created by Andrea Monroy on 1/14/23.
//

import XCTest
@testable import SquareEmployeeDirectoryApp

final class PhotoModelDataService_Tests: XCTestCase {
    
    // MARK: - Properties
    var sut: PhotoModelCacheManager! //system under test
    
    // MARK: - Set Up
    override func setUp() {
        super.setUp()
        sut = PhotoModelCacheManager.instance
    }
    // MARK: - Tear Down
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAdd() {
      
        let testImage = UIImage()
        
       
        sut.add(key: "testKey", value: testImage)
    
        let cachedImage = sut.get(key: "testKey")
        
        // Assert that the cached image is the same as the test image
        XCTAssertEqual(testImage, cachedImage)
    }
    
    func testGet() {
        let cachedImage = sut.get(key: "nonExistentKey")
        
        // Assert that the output is nil
        XCTAssertNil(cachedImage)
    }
    
    func testCacheLimit() {
  
        for i in 0..<210 {
            let testImage = UIImage()
            sut.add(key: "testKey\(i)", value: testImage)
        }
        
        
        XCTAssertEqual(sut.photoCache.countLimit, 200)
    }
    
    func testCacheCostLimit() {
        // Create test images
        let testImage1 = UIImage()
        let testImage2 = UIImage()
     
        sut.add(key: "testKey1", value: testImage1)
        sut.add(key: "testKey2", value: testImage2)
        
        // Assert less than or equal to 200 MB
        XCTAssertLessThanOrEqual(sut.photoCache.totalCostLimit, 1024 * 1024 * 200)
    }
    
    func testCacheRemove() {
       
        for i in 0..<210 {
            let testImage = UIImage()
            sut.add(key: "testKey\(i)", value: testImage)
        }
        
   
        XCTAssertEqual(sut.photoCache.countLimit, 200)
        
      
        for i in 0..<10 {
            XCTAssertNil(sut.get(key: "testKey\(i)"))
        }
    }
    
}



