//
//  UserInfoTests.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit
import XCTest

class UserInfoTests: XCTestCase {
    
    var user : UserInfo!
    
    override func setUp() {
        super.setUp()
        user = UserInfo(
            user_id: 007,
            display_name: "James Bond",
            link: "http://www.example.com/007",
            profileImage: "http://www.example.com/007image")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testUserInfo_init() {
        XCTAssertNotNil(user, "user should not be nil after init")
    }
    
    func testUserInfo_init_id_equal() {
        var user_id = 007
        XCTAssertEqual(user_id, user.user_id, "id does not match")
    }
    
    func testUserInfo_init_name_equal() {
        var display_name = "James Bond"
        XCTAssertEqual(display_name, user.display_name, "id does not match")
    }

}
