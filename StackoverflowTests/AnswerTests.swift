//
//  AnswerTests.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit
import XCTest

class AnswerTests: XCTestCase {
    
    var answer : Answer!

    override func setUp() {
        super.setUp()
        var answer_id = 100
        var question_id = 101
        var is_accepted = true
        var link = "https://www.example.com/"
        
        answer = Answer(
            answer_id: answer_id,
            question_id: question_id,
            is_accepted: is_accepted,
            link: link)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAnswer_init() {
        XCTAssertNotNil(answer, "answer should not be nil after init")
    }

}
