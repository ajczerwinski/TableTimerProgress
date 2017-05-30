//
//  Assistant+CoreDataProperties.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 5/29/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData


extension Assistant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assistant> {
        return NSFetchRequest<Assistant>(entityName: "Assistant")
    }

    @NSManaged public var price: Double
    @NSManaged public var numPurchased: Double
    @NSManaged public var numAvailable: Double

}
