//
//  Role+CoreDataProperties.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 5/29/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData


extension Role {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Role> {
        return NSFetchRequest<Role>(entityName: "Role")
    }

    @NSManaged public var desc: String?
    @NSManaged public var title: String?
    @NSManaged public var numOwned: Int64
    @NSManaged public var startingRoleTime: Double
    @NSManaged public var updatingRoleTime: Double
    @NSManaged public var isRoleEnabled: Bool
    @NSManaged public var base: Double
    @NSManaged public var timesTapped: Double
    @NSManaged public var price: Double

}
