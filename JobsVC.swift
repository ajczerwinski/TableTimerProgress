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
    
    
    // UI Images
    
    @IBOutlet var roleImg: [UIImageView]!
    
    
    // Progress Bars
    
    @IBOutlet var progressBar: [UIProgressView]!
    
    
    // var timesTapped: Float = 0.0
    var timer = Timer()
    var tenths = 100
    var score: Float = 0.0
    
    var roleImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
    
    // store # of times tapped for each role
    
    var timesTapped: [Float] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var multiplier: [Float] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    var roleBase: [Float] = [1, 5, 10, 20, 50, 100, 500, 1000, 2000, 10000]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatImages()
        
    }

    
    @IBAction func gameButton(_ sender: UIButton) {
        
        let buttonTag = sender.tag
        
        addMoney(tag: buttonTag)
        
    }
    
    func addMoney(tag: Int) {
        
        timesTapped[tag] += 0.1
        
        switch tag {
            
        case 0:
            if progressBar[tag].progress == 1.0 {
                score += multiplier[tag] * roleBase[tag]
                scoreLbl.text = moneyFormatter(amount: Float(score))
                progressBar[tag].progress = 0
                
            }
            progressBar[tag].progress += 0.1
            
            break
        case 1:
            progressBar[tag].progress += 0.1
            
        default:
            return
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
        }
        
    }
    
    
    
}
