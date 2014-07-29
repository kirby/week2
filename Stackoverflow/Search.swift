//
//  Search.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/29/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

class Search {
    
    var question_id : Int!
    var title : String!
    
    init(question_id : Int, title : String) {
        self.question_id = question_id
        self.title = title
    }
    
    class func parseFromNSData(data : NSData) -> [Search] {
        
        var results = [Search]()
        
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var search : Search!
            
            var question_id = item["question_id"] as? Int
            var title = item["title"] as? String

            results.append(Search(question_id: question_id!, title: title!))
            
        }
        
        return results
        
    }
}