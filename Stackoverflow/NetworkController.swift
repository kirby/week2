//
//  NetworkController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/29/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    /*
    /2.2/search?order=desc&sort=activity&intitle=Swift&site=stackoverflow
    */
    
    var endpoints = [
        "search" : SEARCH_ENDPOINT,
        "badges" : BADGE_ENDPOINT
    ]
    
    var prefix = "https://api.stackexchange.com"
    // restrict page size to 5 for now
    var pagesieze = 5
    var suffix = "/2.2/search?order=desc&sort=activity&site=stackoverflow&pagesize="  // 1&intitle="
  
    func fetchBadgesForSearchTerm(searchTerm : String, callback : (badges : [BadgeModel]?, errorDescription : String?) -> Void) {
        
        println("fetchBadges for \(searchTerm)")
        
        let url = NSURL(string: "\(BADGE_ENDPOINT)\(searchTerm)")
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url, completionHandler: {(data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
            
            if error {
                println("error")
                callback(badges: nil, errorDescription: "Error")
                return
            }
            
            if let statusCode = response as? NSHTTPURLResponse {
                if statusCode.statusCode != 200 {
                    println("\(statusCode)")
                    callback(badges: nil, errorDescription: "Could not continue.  HTTP Status Code was \(statusCode)")
                    return
                }
            }
            
            callback(badges: BadgeModel.parseFromData(data), errorDescription: nil)
            
            })
        
        task.resume()
    }
    
    
    func fetchQuestionsForSearchTerm(searchTerm : String, callback : (questions : [QuestionModel]?, errorDescription : String?) -> Void) {
        
        println("fetchQuestions for \(searchTerm)")
        
        let url = NSURL(string: "\(prefix)\(suffix)\(pagesieze)&intitle=\(searchTerm)")
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url, completionHandler: {(data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
            
            if error {
                println("error")
                callback(questions: nil, errorDescription: "Error")
                return
            }
            
            if let statusCode = response as? NSHTTPURLResponse {
                if statusCode.statusCode != 200 {
                    println("\(statusCode)")
                    callback(questions: nil, errorDescription: "Could not continue.  HTTP Status Code was \(statusCode)")
                    return
                }
            }
            
            callback(questions: QuestionModel.parseQuestions(data), errorDescription: nil)
            
            })
        
        task.resume()
    }
    
    func fetchForSearchTerm(service : String, searchTerm : String, callback : (responses : [AnyObject]?, errorDescription : String?) -> Void) {
        
        println("fetchForSearchTerm for \(service) \(searchTerm)")
        
        let url = getURLForService(service, searchTerm: searchTerm)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url, completionHandler: {(data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
            
            if error {
                println("error")
                callback(responses: nil, errorDescription: "Error")
                return
            }
            
            if let statusCode = response as? NSHTTPURLResponse {
                if statusCode.statusCode != 200 {
                    println("\(statusCode)")
                    callback(responses: nil, errorDescription: "Could not continue.  HTTP Status Code was \(statusCode)")
                    return
                }
            }
            
            callback(responses: QuestionModel.parseQuestions(data), errorDescription: nil)
            
            })
        
        task.resume()
    }
    
    func getURLForService(service : String, searchTerm : String) -> NSURL? {
        
//        if let endpoint = endpoints[service]! + searchTerm {
//            if let url = NSURL(string: endpoint) {
//                return url
//            }
//        }
        

        return nil
    }
}