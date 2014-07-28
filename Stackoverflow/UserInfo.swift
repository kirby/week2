//
//  UserInfo.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation

class UserInfo {
    
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
    
}