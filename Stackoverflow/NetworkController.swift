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
    
    var prefix = "https://api.stackexchange.com"
    // restrict page size to 5 for now
    var pagesieze = 5
    var suffix = "/2.2/search?order=desc&sort=activity&site=stackoverflow&pagesize="  // 1&intitle="
    
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
    
}