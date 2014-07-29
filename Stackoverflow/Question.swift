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
    
    class func parseQuestions(data : NSData) -> [Question] {
        
        var results = [Question]()
        
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var question : Question!
            var user : User!
            
            var question_id = item["question_id"] as? Int
            var title = item["title"] as? String
            var is_answered = item["is_answered"] as? Bool
            var link = item["link"] as? String
            var answer_count = item["answer_count"] as? Int
            
            println("title = \(title)")
            
            if let owner = item["owner"] as? NSDictionary {
                var user_id = owner["user_id"] as? Int
                var display_name = owner["display_name"] as? String
                var link = owner["link"] as? String
                var profile_image = owner["profile_image"] as? String
                
                user = User(
                    user_id: user_id!,
                    display_name: display_name!,
                    link: link!,
                    profileImage: profile_image!)
            }
            
            var tags = [String]()
            
            if let array = item["tags"] as? NSArray {
                for tag in array {
                    tags.append("\(tag)")
                }
            }
            
            results.append(Question(
                question_id: question_id!,
                title: title!,
                is_answered: is_answered!,
                link: link!,
                owner: user,
                answer_count: answer_count!,
                tags: tags))
        }
        
        return results
        
    }
    
}