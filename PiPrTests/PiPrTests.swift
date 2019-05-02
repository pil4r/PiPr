//
//  PiPrTests.swift
//  PiPrTests
//
//  Created by Pilar Del Rosario Prospero Zeferino on 4/30/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import XCTest
@testable import PiPr

class ResumeServiceMock: ResumeService {
    fileprivate let information: Resume
    init(info: Resume) {
        self.information = info
    }
    
    override func getResume(informationRetrieved: @escaping (Resume?) -> ()) {
        informationRetrieved(information)
    }
    
}

class PiPrTests: XCTestCase {

    override func setUp() {
        // Pwnding to 
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
