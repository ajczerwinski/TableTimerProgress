
//  Score.swift
//  ClickDevTime
//
//  Created by Allen Czerwinski on 6/28/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit












//class Score: NSObject, NSCoding {
//
//    /*// Array of Doubles to store original countdown number to reset when counter gets to 0
//     var startingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
//
//     // Array of Doubles to store countdown timer numbers
//     var updatingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
//
//     var assistantPrice: Double = 1000000
//
//     var runningScore: Double = 0.0
//
//     var totalScore: Double = 0.0
//
//     var assistantsAvailable: Double = 0.0
//
//     var assistantsPurchased: Double = 0.0
//
//     var assistantsPurchasedMultiplier: Double = 1.0*/
//
//    var roleImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
//
//    /* // Store # of times tapped for each role
//
//     var timesTapped: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//
//     // Multiplier for each role
//     var multiplier: [Double] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
//
//     // Array of Bools to determine if role should be visible/active or not
//     var isRoleEnabled: [Bool] = [true, false, false, false, false, false, false, false, false, false]
//
//     // Purchase price for each role
//     var purchasePrice: [Double] = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000]
//
//     // Base score that each role gives when progressBar or progressTimer completes
//     var roleBase: [Double] = [1, 5, 10, 20, 50, 100, 500, 1000, 2000, 10000]
//
//     // Number of roles owned
//     var rolesOwned: [Double] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]  */
//
//    // Array of Doubles to store original countdown number to reset when counter gets to 0
//    var startingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
//
//    // Array of Doubles to store countdown timer numbers
//    var updatingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
//
//    var assistantPrice: Double = 0.0
//
//    var runningScore: Double = 0.0
//
//    var totalScore: Double = 0.0
//
//    var assistantsAvailable: Double = 0.0
//
//    var assistantsPurchased: Double = 0.0
//
//    var assistantsPurchasedMultiplier: Double = 1.0
//
//    // Store # of times tapped for each role
//
//    var timesTapped: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//
//    // Multiplier for each role
//    var multiplier: [Double] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
//
//    // Array of Bools to determine if role should be visible/active or not
//    var isRoleEnabled: [Bool] = [true, false, false, false, false, false, false, false, false, false]
//
//    // Purchase price for each role
//    var purchasePrice: [Double] = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000]
//
//    // Base score that each role gives when progressBar or progressTimer completes
//    var roleBase: [Double] = [1, 5, 10, 20, 50, 100, 500, 1000, 2000, 10000]
//
//    // Number of roles owned
//    var rolesOwned: [Double] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//
//
//    init(startingRoleTimeArray: [Double], updatingRoleTimeArray: [Double], assistantPrice: Double, runningScore: Double, totalScore: Double, assistantsAvailable: Double, assistantsPurchased: Double, assistantsPurchasedMultiplier: Double, timesTapped: [Double], multiplier: [Double], isRoleEnabled: [Bool], purchasePrice: [Double], roleBase: [Double], rolesOwned: [Double]) {
//
//        self.startingRoleTimeArray = startingRoleTimeArray
//        self.updatingRoleTimeArray = updatingRoleTimeArray
//        self.assistantPrice = assistantPrice
//        self.runningScore = runningScore
//        self.totalScore = totalScore
//        self.assistantsAvailable = assistantsAvailable
//        self.assistantsPurchased = assistantsPurchased
//        self.assistantsPurchasedMultiplier = assistantsPurchasedMultiplier
//        self.timesTapped = timesTapped
//        self.multiplier = multiplier
//        self.isRoleEnabled = isRoleEnabled
//        self.purchasePrice = purchasePrice
//        self.roleBase = roleBase
//        self.rolesOwned = rolesOwned
//
//    }
//
//    required convenience init?(coder decoder: NSCoder) {
//
//        guard let startingRoleTimeArray = decoder.decodeObject(forKey: "startingRoleTimeArray") as? [Double],
//        let updatingRoleTimeArray = decoder.decodeObject(forKey: "updatingRoleTimeArray") as? [Double],
//        let assistantPrice = decoder.decodeObject(forKey: "assistantPrice") as? Double,
//        let runningScore = decoder.decodeObject(forKey: "runningScore") as? Double,
//        let totalScore = decoder.decodeObject(forKey: "totalScore") as? Double,
//        let assistantsAvailable = decoder.decodeObject(forKey: "assistantsAvailable") as? Double,
//        let assistantsPurchased = decoder.decodeObject(forKey: "assistantsPurchased") as? Double,
//        let assistantsPurchasedMultiplier = decoder.decodeObject(forKey: "assistantsPurchasedMultiplier") as? Double,
//        let timesTapped = decoder.decodeObject(forKey: "timesTapped") as? [Double],
//        let multiplier = decoder.decodeObject(forKey: "multiplier") as? [Double],
//        let isRoleEnabled = decoder.decodeObject(forKey: "isRoleEnabled") as? [Bool],
//        let purchasePrice = decoder.decodeObject(forKey: "purchasePrice") as? [Double],
//        let roleBase = decoder.decodeObject(forKey: "roleBase") as? [Double],
//        let rolesOwned = decoder.decodeObject(forKey: "rolesOwned") as? [Double]
//
//        else { return nil }
//
//        self.init(
//            startingRoleTimeArray: decoder.decodeObject(forKey: "startingRoleTimeArray") as! [Double],
//            updatingRoleTimeArray: decoder.decodeObject(forKey: "updatingRoleTimeArray") as! [Double],
//            assistantPrice: decoder.decodeDouble(forKey: "assistantPrice"),
//            runningScore: decoder.decodeDouble(forKey: "runningScore"),
//            totalScore: decoder.decodeDouble(forKey: "totalScore"),
//            assistantsAvailable: decoder.decodeDouble(forKey: "assistantsAvailable"),
//            assistantsPurchased: decoder.decodeDouble(forKey: "assistantsPurchased"),
//            assistantsPurchasedMultiplier: decoder.decodeDouble(forKey: "assistantsPurchasedMultiplier"),
//            timesTapped: decoder.decodeObject(forKey: "timesTapped") as! [Double],
//            multiplier: decoder.decodeObject(forKey: "multiplier") as! [Double],
//            isRoleEnabled: decoder.decodeObject(forKey: "isRoleEnabled") as! [Bool],
//            purchasePrice: decoder.decodeObject(forKey: "purchasePrice") as! [Double],
//            roleBase: decoder.decodeObject(forKey: "roleBase") as! [Double],
//            rolesOwned: decoder.decodeObject(forKey: "rolesOwned") as! [Double]
//
//        )
//
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(self.startingRoleTimeArray, forKey: "startingRoleTimeArray")
//        aCoder.encode(self.updatingRoleTimeArray, forKey: "updatingRoleTimeArray")
//        aCoder.encode(self.assistantPrice, forKey: "assistantPrice")
//        aCoder.encode(self.runningScore, forKey: "runningScore")
//        aCoder.encode(self.totalScore, forKey: "totalScore")
//        aCoder.encode(self.assistantsAvailable, forKey: "assistantsAvailable")
//        aCoder.encode(self.assistantsPurchased, forKey: "assistantsPurchased")
//        aCoder.encode(self.assistantsPurchasedMultiplier, forKey: "assistantsPurchasedMultiplier")
//        aCoder.encode(self.timesTapped, forKey: "timesTapped")
//        aCoder.encode(self.multiplier, forKey: "multiplier")
//        aCoder.encode(self.isRoleEnabled, forKey: "isRoleEnabled")
//        aCoder.encode(self.purchasePrice, forKey: "purchasePrice")
//        aCoder.encode(self.roleBase, forKey: "roleBase")
//        aCoder.encode(self.rolesOwned, forKey: "rolesOwned")
//    }
//
//}

