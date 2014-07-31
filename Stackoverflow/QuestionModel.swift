//
//  Question.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

let SEARCH_ENDPOINT = "https://api.stackexchange.com2.2/search?order=desc&sort=activity&site=stackoverflow&intitle="

class QuestionModel : NSObject {
    
    var question_id : Int?
    var title : String?
    var is_answered : Bool?
    var link : String?
    var owner : UserModel?
    var answer_count : Int?
    var tags : [String]?

    init() {
        
    }
    
    init(title : String) {
        self.title = title
    }
    
    init(question_id : Int, title : String, is_answered : Bool, link : String, owner : UserModel, answer_count : Int, tags : [String]) {
        self.question_id = question_id
        self.title = title
        self.is_answered = is_answered
        self.link = link
        self.owner = owner
        self.answer_count = answer_count
        self.tags = tags
    }
    
    class func parseQuestions(data : NSData) -> [QuestionModel] {
        
        var questions = [QuestionModel]()
        
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary {
            
            if let items = json["items"] as? NSArray {
                
                for item in items {
                    
                    if let itemDict = item as? NSDictionary {
                        
                        let question = QuestionModel()
                        // let question = Question(itemDict) //
                        question.title = itemDict["title"] as? String
                        question.link = itemDict["link"] as? String
                        question.question_id = itemDict["question_id"] as? Int

//                        question.tags = itemDict["tags"] as? [String]
//                        if let lastEditDate = NSDate(timeIntervalSince1970: itemDict["last_edit_date"] as? Double) {
//                            
//                        }
                        //question.last_edit_date = itemDict["last_edit_date"] as? NSDate
                        
                        questions += question
                        
                    }
                }
            }
        }
        return questions
    }
    
}