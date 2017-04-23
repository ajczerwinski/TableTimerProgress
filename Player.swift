//
//  Player+CoreDataClass.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/21/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData

@objc(Player)
public class Player: NSManagedObject {
    
    convenience init(score: Float = 0.0, context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Player", in: context) {
            self.init(entity: ent, insertInto: context)
            self.score = score
            self.creationDate = Date() as NSDate
        } else {
            fatalError("Unable to find entity")
        }
    }

}
