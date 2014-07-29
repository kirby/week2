//
//  UserInfo.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

class User {
    
    var user_id : Int!
    var display_name : String!
    var link : String!
    var profile_image : String!
    
    
    init(user_id : Int, display_name : String, link : String, profileImage : String) {
        self.user_id = user_id
        self.display_name = display_name
        self.link = link
        self.profile_image = profileImage
    }
    
    class func parseUsers(data : NSData) -> [User] {
        
        var results = [User]()
        
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        var items = json["items"] as? Array<NSDictionary>
        println("items.count = \(items!.count)")
        
        for item in items! {
            
            var user : User!
            
            var user_id = item["user_id"] as? Int
            var display_name = item["display_name"] as? String
            var link = item["link"] as? String
            var profile_image = item["profile_image"] as? String
            
            results.append(User(
                user_id: user_id!,
                display_name: display_name!,
                link: link!,
                profileImage: profile_image!))
            
        }
        
        return results
        
    }
}