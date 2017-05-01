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
    
    @IBOutlet weak var studentDevImg: UIImageView!
    @IBOutlet weak var internDevImg: UIImageView!
    @IBOutlet weak var juniorDevImg: UIImageView!
    @IBOutlet weak var devImg: UIImageView!
    @IBOutlet weak var seniorDevImg: UIImageView!
    @IBOutlet weak var leadDevImg: UIImageView!
    @IBOutlet weak var staffEngImg: UIImageView!
    @IBOutlet weak var seniorStaffEngImg: UIImageView!
    @IBOutlet weak var distinguishedEngImg: UIImageView!
    @IBOutlet weak var superDistEngImg: UIImageView!
    
    
    // Progress Bars
    
    @IBOutlet weak var studentProgress: UIProgressView!
    @IBOutlet weak var internProgress: UIProgressView!
    @IBOutlet weak var juniorProgress: UIProgressView!
    @IBOutlet weak var devProgress: UIProgressView!
    @IBOutlet weak var seniorProgress: UIProgressView!
    @IBOutlet weak var leadProgress: UIProgressView!
    @IBOutlet weak var staffProgress: UIProgressView!
    @IBOutlet weak var seniorStaffProgress: UIProgressView!
    @IBOutlet weak var distinguishedProgress: UIProgressView!
    @IBOutlet weak var superDistProgress: UIProgressView!
    
    
    var timesTapped: Float = 0.0
    var timer = Timer()
    var tenths = 100
    var score = 0.0
    var multiplier: Float = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatImages()
        
    }
    
    
    @IBAction func studentDevBtn(_ sender: UIButton) {
        
        timesTapped += 0.1
        
        
        if studentProgress.progress == 1.0 {
            score += 1.0
            scoreLbl.text = moneyFormatter(amount: Float(score))
            studentProgress.progress = 0.0
            timesTapped = 0.0
        }
        
        studentProgress.progress = timesTapped
        
    }
    
    @IBAction func internDevBtn(_ sender: UIButton) {
        
        timesTapped += 0.1
        
        
        if internProgress.progress == 1.0 {
            score += 5.0
            scoreLbl.text = moneyFormatter(amount: Float(score))
            internProgress.progress = 0.0
            timesTapped = 0.0
        }
        
        internProgress.progress = timesTapped
        
    }
    
    @IBAction func juniorDevBtn(_ sender: UIButton) {
    }
    
    @IBAction func devBtn(_ sender: UIButton) {
    }
    
    @IBAction func seniorDevBtn(_ sender: UIButton) {
    }
    
    @IBAction func leadDevBtn(_ sender: UIButton) {
    }
    
    @IBAction func staffEngBtn(_ sender: UIButton) {
    }
    
    @IBAction func seniorStaffEngBtn(_ sender: UIButton) {
    }
    
    @IBAction func distinguishedEngBtn(_ sender: UIButton) {
    }
    
    @IBAction func superDistinguishedEngBtn(_ sender: UIButton) {
    }
    
    
    
    
    
    
    
    
    
    /* func gameButton() {
        
        timesTapped += 0.1
        
        
        if progressBar.progress == 1.0 {
            money += 1.0
            moneyLbl.text = moneyFormatter(amount: Float(money))
            progressBar.progress = 0.0
            timesTapped = 0.0
        }
        
        progressLbl.text = tapperProgressFormatter(text: timesTapped)
        progressBar.progress = timesTapped
        
    } */
    
    
    func formatImages() {
        
        studentDevImg.layer.cornerRadius = studentDevImg.frame.height / 2
        studentDevImg.clipsToBounds = true
        
        internDevImg.layer.cornerRadius = internDevImg.frame.height / 2
        internDevImg.clipsToBounds = true
        
        juniorDevImg.layer.cornerRadius = juniorDevImg.frame.height / 2
        juniorDevImg.clipsToBounds = true
        
        devImg.layer.cornerRadius = devImg.frame.height / 2
        devImg.clipsToBounds = true
        
        seniorDevImg.layer.cornerRadius = seniorDevImg.frame.height / 2
        seniorDevImg.clipsToBounds = true
        
        leadDevImg.layer.cornerRadius = leadDevImg.frame.height / 2
        leadDevImg.clipsToBounds = true
        
        staffEngImg.layer.cornerRadius = staffEngImg.frame.height / 2
        staffEngImg.clipsToBounds = true
        
        seniorStaffEngImg.layer.cornerRadius = seniorStaffEngImg.frame.height / 2
        seniorStaffEngImg.clipsToBounds = true
        
        distinguishedEngImg.layer.cornerRadius = distinguishedEngImg.frame.height / 2
        distinguishedEngImg.clipsToBounds = true
        
        superDistEngImg.layer.cornerRadius = superDistEngImg.frame.height / 2
        superDistEngImg.clipsToBounds = true
        
    }
    
    func moneyFormatter(amount: Float) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: amount))!
        
    }
    
}
