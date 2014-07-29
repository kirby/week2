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
    
    class func parseAnswers(data : NSData) -> [Answer] {
        
        var results = [Answer]()
        
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var answer : Answer!
            var user : User!
            
            var answer_id = item["answer_id"] as? Int
            var question_id = item["question_id"] as? Int
            var is_accepted = item["is_accepted"] as? Bool
            
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
            
            results.append(Answer(
                answer_id: answer_id!,
                question_id: question_id!,
                is_accepted: is_accepted!,
                owner: user!))
            
        }
        
        return results
        
    }
}