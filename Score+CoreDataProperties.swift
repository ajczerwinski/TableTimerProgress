//
//  Score+CoreDataProperties.swift
//  ClickDevTime
//
//  Created by Allen Czerwinski on 10/1/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var savedScore: Double
    @NSManaged public var logoutStamp: Double
    @NSManaged public var loginStamp: Double
    @NSManaged public var offlinePoints: Double

}
