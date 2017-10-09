
//  Score.swift
//  ClickDevTime
//
//  Created by Allen Czerwinski on 6/28/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit

struct Score {
    
    static let defaults = UserDefaults.standard
    
    var runningScore: Double = 0.0 {
        didSet {
            Score.defaults.set(runningScore, forKey: "runningScore")
        }
    }
    
    var assistantPrice: Double = 1000000 {
        didSet {
            Score.defaults.set(assistantPrice, forKey: "assistantPrice")
            print("updated the assistantPrice: \(assistantPrice)")
        }
    }
    
    var totalScore: Double = 0.0 {
        didSet {
            Score.defaults.set(totalScore, forKey: "totalScore")
            print("updated the totalScore: \(totalScore)")
        }
    }
    
    var assistantsAvailable: Double = 0.0 {
        didSet {
            Score.defaults.set(assistantsAvailable, forKey: "assistantsAvailable")
            print("updated the assistantsAvailable: \(assistantsAvailable)")
        }
    }
    
    var assistantsPurchased: Double = 0.0 {
        didSet {
            Score.defaults.set(assistantsPurchased, forKey: "assistantsPurchased")
            print("updated the assistantsPurchased: \(assistantsPurchased)")
        }
    }
    
    var assistantsPurchasedMultiplier: Double = 1.0 {
        didSet {
            Score.defaults.set(assistantsPurchasedMultiplier, forKey: "assistantsPurchasedMultiplier")
            print("updated the assistantsPurchasedMultiplier: \(assistantsPurchasedMultiplier)")
        }
    }

    // Store # of times tapped for each role
    
    var timesTapped: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] {
        didSet {
            Score.defaults.set(timesTapped, forKey: "timesTapped")
            print("updated the timesTapped: \(timesTapped)")
        }
    }
    
    // Multiplier for each role
    var multiplier: [Double] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1] {
        didSet {
            Score.defaults.set(multiplier, forKey: "multiplier")
            print("updated the multiplier: \(multiplier)")
        }
    }
    
    // Array of Bools to determine if role should be visible/active or not
    var isRoleEnabled: [Bool] = [true, false, false, false, false, false, false, false, false, false] {
        didSet {
            Score.defaults.set(isRoleEnabled, forKey: "isRoleEnabled")
            print("updated the isRoleEnabled: \(isRoleEnabled)")
        }
    }
    
    // Purchase price for each role
    var purchasePrice: [Double] = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000] {
        didSet {
            Score.defaults.set(purchasePrice, forKey: "purchasePrice")
            print("updated the purchasePrice: \(purchasePrice)")
        }
    }
    
    // Base score that each role gives when progressBar or progressTimer completes
    var roleBase: [Double] = [1, 5, 10, 20, 50, 100, 500, 1000, 2000, 10000] {
        didSet {
            Score.defaults.set(roleBase, forKey: "roleBase")
            print("updated the roleBase: \(roleBase)")
        }
    }
    
    // Number of roles owned
    var rolesOwned: [Double] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0] {
        didSet {
            Score.defaults.set(rolesOwned, forKey: "rolesOwned")
            print("updated the rolesOwned: \(rolesOwned)")
        }
    }
    
    var timer: [Timer] = [Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer()]
    
    // Array of Doubles to store original countdown number to reset when counter gets to 0
    var startingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000] {
        didSet {
            Score.defaults.set(startingRoleTimeArray, forKey: "startingRoleTimeArray")
            print("updated the startingRoleTimeArray: \(startingRoleTimeArray)")
        }
    }
    
    // Array of Doubles to store countdown timer numbers
    var updatingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000] {
        didSet {
            Score.defaults.set(updatingRoleTimeArray, forKey: "updatingRoleTimeArray")
            print("updated the updatingRoleTimeArray: \(updatingRoleTimeArray)")
        }
    }
    
}
