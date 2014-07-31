//
//  Tag.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/31/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation
import CoreData

class Tag: NSManagedObject {

    @NSManaged var text: String
    @NSManaged var questions: NSSet

}
