//
//  Player+CoreDataProperties.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/21/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var creationDate: NSDate?
    @NSManaged public var score: Float
    @NSManaged public var jobs: Job?

}
