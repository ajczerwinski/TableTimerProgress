//
//  Score+CoreDataClass.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 5/29/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import Foundation
import CoreData


public class Score: NSManagedObject {
    
    var roleMultiplier: [Double] = [1, 1, 5, 10, 50, 100, 250, 750, 2500, 10000, 25000]

    func scoreIncrementer(roleIndex: Int) -> Double {
        runningScore += roleMultiplier[roleIndex]
        
        return runningScore
        
    }
    
}
