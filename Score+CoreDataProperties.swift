//
//  Score+CoreDataProperties.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 5/29/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var runningScore: Double
    @NSManaged public var totalScore: Double

}
