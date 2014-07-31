//
//  Tag.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/31/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation
import CoreData

class Tag: NSManagedObject {

    @NSManaged var text: String
    @NSManaged var questions: NSSet

}
