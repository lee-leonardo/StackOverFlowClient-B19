//
//  UserTests.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit
import XCTest

class UserTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testUserData() {
		var sampleModel : Dictionary = ["display_name":"leoleez", "reputation":46, "accountID":140345, "userID":156273, "score":5]
		
	}

}
