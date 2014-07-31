//
//  Stackoverflow.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

class Stackoverflow {
    
    var answers = [AnswerModel]()
    var questions = [QuestionModel]()
    var users = [UserModel]()
    
    
    // parse answer JSON
    func parseAnswers(data : NSData) {

        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var answer : AnswerModel!
            var user : UserModel!
            
            var answer_id = item["answer_id"] as? Int
            var question_id = item["question_id"] as? Int
            var is_accepted = item["is_accepted"] as? Bool
            
            if let owner = item["owner"] as? NSDictionary {
                var user_id = owner["user_id"] as? Int
                var display_name = owner["display_name"] as? String
                var link = owner["link"] as? String
                var profile_image = owner["profile_image"] as? String
                
                user = UserModel(
                    user_id: user_id!,
                    display_name: display_name!,
                    link: link!,
                    profileImage: profile_image!)
            }
            
            answers.append(AnswerModel(
                answer_id: answer_id!,
                question_id: question_id!,
                is_accepted: is_accepted!,
                owner: user!))
            
        }
        
    }
    
    // parse question JSON
    func parseQuestions(data : NSData) {
        
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var question : QuestionModel!
            var user : UserModel!
            
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
                
                user = UserModel(
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
            
            questions.append(QuestionModel(
                question_id: question_id!,
                title: title!,
                is_answered: is_answered!,
                link: link!,
                owner: user,
                answer_count: answer_count!,
                tags: tags))
        }
    }
    
    // parse users JSON
    func parseUsers(data : NSData) {
        
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var user : UserModel!
            
            var user_id = item["user_id"] as? Int
            var display_name = item["display_name"] as? String
            var link = item["link"] as? String
            var profile_image = item["profile_image"] as? String
            
            users.append(UserModel(
                user_id: user_id!,
                display_name: display_name!,
                link: link!,
                profileImage: profile_image!))
            
        }
    }
    
}