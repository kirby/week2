//
//  QuestionTests.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit
import XCTest

class StackoverflowTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testAnswer_mock_json() {
        var mockData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("answer-mock", ofType: "json"))
        var stackoverflow = Stackoverflow()
        stackoverflow.parseAnswers(mockData)
        XCTAssertEqual(stackoverflow.answers.count, 1, "There should be one answer from mock data")
    }
    
    func testQuestion_mock_json() {
        var mockData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("question-mock", ofType: "json"))
        var stackoverflow = Stackoverflow()
        stackoverflow.parseQuestions(mockData)
        XCTAssertEqual(stackoverflow.questions.count, 1, "There should be one question from mock data")
    }
    
    func testUser_mock_json() {
        var mockData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("user-mock", ofType: "json"))
        var stackoverflow = Stackoverflow()
        stackoverflow.parseUsers(mockData)
        XCTAssertEqual(stackoverflow.users.count, 1, "There should be one user from mock data")
    }

}