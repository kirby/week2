//
//  Question.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/31/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation
import CoreData

class Question: NSManagedObject {

    @NSManaged var question_id: NSNumber
    @NSManaged var title: String
    @NSManaged var link: String
    @NSManaged var tags: NSSet
    @NSManaged var owner: User

}
