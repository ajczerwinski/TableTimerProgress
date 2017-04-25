//
//  Job+CoreDataClass.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/21/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData

@objc(Job)
public class Job: NSManagedObject {
    
    convenience init(role: String, context: NSManagedObjectContext) {
        
        if let ent = NSEntityDescription.entity(forEntityName: "Job", in: context) {
            self.init(entity: ent, insertInto: context)
            self.role = role
            self.creationDate = Date() as NSDate
        } else {
            fatalError("Unable to find Entity name!")
        }
        
    }

}
