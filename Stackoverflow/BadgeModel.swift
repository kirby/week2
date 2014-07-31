//
//  File.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/31/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

let BADGE_ENDPOINT = "https://api.stackexchange.com/2.2/badges?order=desc&sort=rank&site=stackoverflow&inname="

class BadgeModel : NSObject {
    
    var badge_id : Int!
    var name : String!
    var link : String!
    var rank : String!
    
    init(badge_id : Int, name : String, link : String, rank : String) {
        self.badge_id = badge_id
        self.name = name
        self.link = link
        self.rank = rank
    }
    
    class func parseFromData(data : NSData) -> [BadgeModel] {
    
        var results = [BadgeModel]()
        
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var badge_id = item["badge_id"] as? Int
            var name = item["name"] as? String
            var link = item["link"] as? String
            var rank = item["rank"] as? String
            
            results.append(BadgeModel(badge_id: badge_id!, name: name!, link: link!, rank: rank!))
        }
        
        return results
    
    }
    
/*
    
/2.2/badges?order=desc&sort=rank&inname=swift&site=stackoverflow
    
{
"badge_type": "tag_based",
"award_count": 17,
"rank": "bronze",
"badge_id": 4076,
"link": "http://stackoverflow.com/badges/4076/swift",
"name": "swift"
}
*/

}