//
//  Answer.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

class Answer {
    
    var answer_id : Int!
    var question_id : Int!
    var is_accepted : Bool!
    var owner : User!
    
    
    init(answer_id : Int, question_id : Int, is_accepted : Bool, owner : User) {
        self.answer_id = answer_id
        self.question_id = question_id
        self.is_accepted = is_accepted
        self.owner = owner
    }
    
    
}