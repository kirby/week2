//
//  User.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/31/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var profile_image: NSData
    @NSManaged var user_id: NSNumber
    @NSManaged var display_name: String
    @NSManaged var link: String
    @NSManaged var questions: NSSet

}
