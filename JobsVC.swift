//
//  JobsVC.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/29/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit


class JobsVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    // Button Labels
    
    @IBOutlet var buttonLbl: [UIButton]!
    
    
    
    @IBOutlet var numRoles: [UIButton]!
    
    @IBOutlet var roleView: [UIView]!
    
    
    // UI Images
    
    @IBOutlet var roleImg: [UIImageView]!
    
    
    // Progress Bars
    
    @IBOutlet var progressBar: [UIProgressView]!
    
    
    // var timesTapped: Float = 0.0
    var timer = Timer()
    var tenths = 100
    var score: Double = 0.0
    
    var roleImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
    
    // store # of times tapped for each role
    
    var timesTapped: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var multiplier: [Double] = [10, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    var isRoleEnabled: [Bool] = [true, false, false, false, false, false, false, false, false, false]
    var purchasePrice: [Double] = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000]
    var roleBase: [Double] = [1, 5, 10, 20, 50, 100, 500, 1000, 2000, 10000]
    var rolesOwned: [Double] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatImages()
        initialFormat()
    }

    
    @IBAction func gameButton(_ sender: UIButton) {
        
        let buttonTag = sender.tag
        
        addMoney(tag: buttonTag)
        
    }
    
    @IBAction func purchaseRole(_ sender: UIButton) {
        
        let buttonTag = sender.tag
        
        spendMoney(tag: buttonTag)
        
        print(rolesOwned)
        
    }
    
    func spendMoney(tag: Int) {
        
        score -= purchasePrice[tag]
        rolesOwned[tag] += 1
        purchasePrice[tag] *= 1.2
        scoreLbl.text = moneyFormatter(amount: Float(score))
        formatUI()
        
    }
    
    func addMoney(tag: Int) {
        
        timesTapped[tag] += 0.1
        
        if progressBar[tag].progress == 1.0 {
            score += multiplier[tag] * roleBase[tag] * rolesOwned[tag]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            
            //formatImages()
            formatUI()
            progressBar[tag].progress = 0
            
        } else {
            progressBar[tag].progress += 0.1
        }
        
    }
    
    func moneyFormatter(amount: Float) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: amount))!
        
    }
    
    func formatImages() {
        
        for role in 0...9 {

            roleImg[role].image = roleImages[role]
            roleImg[role].layer.cornerRadius = roleImg[role].frame.height / 2
            roleImg[role].clipsToBounds = true
            
            numRoles[role].layer.cornerRadius = numRoles[role].frame.height / 2
            numRoles[role].clipsToBounds = true
            
        }
        
        formatUI()
        
    }
    
    func formatUI() {
        
       for role in 1...9 {
            
        if score >= purchasePrice[role]/* && (score - purchasePrice[role] > 0)*/ {
                
                isRoleEnabled[role] = true
                
                buttonLbl[role].isEnabled = isRoleEnabled[role]
                buttonLbl[role].isHidden = !isRoleEnabled[role]
                
            
                
                roleView[role].alpha = 1.0
            } else if (!isRoleEnabled[role] && isRoleEnabled[role - 1]) {
                
                roleView[role].alpha = 0.5
                buttonLbl[role].isHidden = true
                buttonLbl[role].isEnabled = false
            

                
            } else if !isRoleEnabled[role] {
                
                roleView[role].alpha = 0
                buttonLbl[role].isHidden = true
                numRoles[role].isHidden = true
                
            }
            
        }
       
        formatPurchaseBtn()
        formatbuttonLbl()
        
    }
    
    func formatPurchaseBtn() {
        
        for role in 0...9 {
            
            if score >= purchasePrice[role] {
                
                numRoles[role].isEnabled = true
                numRoles[role].isHidden = false
                
                
            } else {
                numRoles[role].isEnabled = false
            }
            
        }
        
    }
    
    func formatbuttonLbl() {
    
        for role in 0...9 {
    
            if rolesOwned[role] >= 1 {
                
                buttonLbl[role].isEnabled = true
                
            } else {
                
                buttonLbl[role].isEnabled = false
                
            }
    
        }
    
    }
    
    func initialFormat() {
        for role in 0...9 {
            
            print("Hi I'm view #",
                "(\(roleView[role].tag))")
            
        }
        isRoleEnabled[0] = true
        buttonLbl[0].isEnabled = isRoleEnabled[0]
        buttonLbl[0].isHidden = !isRoleEnabled[0]
        roleView[0].alpha = 1.0
        
        roleView[1].alpha = 0.5
        buttonLbl[1].isEnabled = false
        buttonLbl[1].isHidden = true
        
    }
    
    
    
    
}
