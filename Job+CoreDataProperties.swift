//
//  Job+CoreDataProperties.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/21/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData


extension Job {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Job> {
        return NSFetchRequest<Job>(entityName: "Job")
    }

    @NSManaged public var image: NSData?
    @NSManaged public var role: String?
    @NSManaged public var desc: String?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var player: Player?

}
