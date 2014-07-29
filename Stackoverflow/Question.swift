//
//  Question.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

class Question {
    
    var question_id : Int!
    var title : String!
    var is_answered : Bool!
    var link : String!
    var owner : User!
    var answer_count : Int!
    var tags = [String]()

    
    init(question_id : Int, title : String, is_answered : Bool, link : String, owner : User, answer_count : Int, tags : [String]) {
        self.question_id = question_id
        self.title = title
        self.is_answered = is_answered
        self.link = link
        self.owner = owner
        self.answer_count = answer_count
        self.tags = tags
    }
    
}