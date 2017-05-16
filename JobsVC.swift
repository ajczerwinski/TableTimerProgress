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
    
    // Game Score Label
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    // Button Label and UI Label Collections
    
    @IBOutlet var buttonLbl: [UIButton]!
    
    @IBOutlet var rolesOwnedLbl: [UILabel]!
    
    @IBOutlet var numRoles: [UIButton]!
    
    @IBOutlet var roleView: [UIView]!
    
    // UI Images Collection
    
    @IBOutlet var roleImg: [UIImageView]!
    
    // Progress Bar Collections
    
    @IBOutlet var progressBar: [UIProgressView]!
    
    @IBOutlet var timerBar: [UIProgressView]!
    
    var timer = Timer()
    
    // Array of Doubles to store original countdown number to reset when counter gets to 0
    var startingRoleTimeArray: [Double] = [100, 1000, 4000, 5000, 5000, 5000, 5000, 5000, 5000, 5000]
    
    // Array of Doubles to store countdown timer numbers
    var updatingRoleTimeArray: [Double] = [100, 1000, 4000, 5000, 5000, 5000, 5000, 5000, 5000, 5000]
    
    var score: Double = 0.0
    
    var roleImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
    
    // Store # of times tapped for each role
    
    var timesTapped: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Multiplier for each role
    var multiplier: [Double] = [1000, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    
    // Array of Bools to determine if role should be visible/active or not
    var isRoleEnabled: [Bool] = [true, false, false, false, false, false, false, false, false, false]
    
    // Purchase price for each role
    var purchasePrice: [Double] = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000]
    
    // Base score that each role increments up when completed
    var roleBase: [Double] = [1, 5, 10, 20, 50, 100, 500, 1000, 2000, 10000]
    
    // Number of roles owned
    var rolesOwned: [Double] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatImages()
        initialFormat()
    }

    // UIButton to increment the progress bar for roles to increase the score
    @IBAction func gameButton(_ sender: UIButton) {
        let buttonTag = sender.tag
        
        addMoney(tag: buttonTag)
        
    }
    
    // UIButton to purchase roles
    @IBAction func purchaseRole(_ sender: UIButton) {
        
        let buttonTag = sender.tag
        
        spendMoney(tag: buttonTag)
        
        // If more 25 or more of a given role are owned, disable clickable progress bar enable timer
        
        if rolesOwned[buttonTag] >= 25 {
            progressBar[buttonTag].isHidden = true
            timerBar[buttonTag].isHidden = false
            
            // Activate role timer based on which buttonTag is selected
            // TODO - rewrite this to pass a parameter through with the selector function to obviate
            // need to use switch statement and individual update timer functions
            switch (buttonTag) {
            case 0:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateStudentTimer)), userInfo: nil, repeats: true)
            case 1:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateInternTimer)), userInfo: nil, repeats: true)
            case 2:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateJuniorTimer)), userInfo: nil, repeats: true)
            case 3:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateDevTimer)), userInfo: nil, repeats: true)
            case 4:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSeniorTimer)), userInfo: nil, repeats: true)
            case 5:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateLeadTimer)), userInfo: nil, repeats: true)
            case 6:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateStaffTimer)), userInfo: nil, repeats: true)
            case 7:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSeniorStaffTimer)), userInfo: nil, repeats: true)
            case 8:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateDistinguishedTimer)), userInfo: nil, repeats: true)
            case 9:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSuperDistinguishedTimer)), userInfo: nil, repeats: true)
                
            default:
                return
            }
          
        }
        
        print(rolesOwned)
        
    }
    
    // Role-specific timer functions to update score labels and timer progress bars for respective roles
    // TODO - refactor these into one function that takes a parameter from the purchaseRole function above
    func updateStudentTimer() {
        
        // If the countdown reaches 0, add score and reset countdown timer to original
        if updatingRoleTimeArray[0] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[0].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[0]), role: 0)
            
            score += multiplier[0] * roleBase[0] * rolesOwned[0]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[0] = startingRoleTimeArray[0]
            
        // If countdown timer is 1 or higher, update timer progressBar and decrement countdown timer by 1
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[0].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[0]), role: 0)
            updatingRoleTimeArray[0] -= 1
        
        }
        
    }
    
    func updateInternTimer() {
        
        if updatingRoleTimeArray[1] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[1].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[1]), role: 1)
            
            score += multiplier[1] * roleBase[1] * rolesOwned[1]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[1] = startingRoleTimeArray[1]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[1].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[1]), role: 1)
            updatingRoleTimeArray[1] -= 1
            
        }
        
    }
    
    func updateJuniorTimer() {
        
        if updatingRoleTimeArray[2] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[2].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[2]), role: 2)
            
            score += multiplier[2] * roleBase[2] * rolesOwned[2]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[2] = startingRoleTimeArray[2]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[2].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[2]), role: 2)
            updatingRoleTimeArray[2] -= 1
            
        }
        
    }
    
    func updateDevTimer() {
        
        if updatingRoleTimeArray[3] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[3].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[3]), role: 3)
            
            score += multiplier[3] * roleBase[3] * rolesOwned[3]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[3] = startingRoleTimeArray[3]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[3].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[3]), role: 3)
            updatingRoleTimeArray[3] -= 1
            
        }
        
    }
    
    func updateSeniorTimer() {
        
        if updatingRoleTimeArray[4] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[4].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[4]), role: 4)
            
            score += multiplier[4] * roleBase[4] * rolesOwned[4]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[4] = startingRoleTimeArray[4]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[4].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[4]), role: 4)
            updatingRoleTimeArray[4] -= 1
            
        }
        
    }
    
    func updateLeadTimer() {
        
        if updatingRoleTimeArray[5] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[5].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[5]), role: 5)
            
            score += multiplier[5] * roleBase[5] * rolesOwned[5]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[5] = startingRoleTimeArray[5]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[5].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[5]), role: 5)
            updatingRoleTimeArray[5] -= 1
            
        }
        
    }
    
    func updateStaffTimer() {
        
        if updatingRoleTimeArray[6] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[6].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[6]), role: 6)
            
            score += multiplier[6] * roleBase[6] * rolesOwned[6]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[6] = startingRoleTimeArray[6]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[6].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[6]), role: 6)
            updatingRoleTimeArray[6] -= 1
            
        }
        
    }
    
    func updateSeniorStaffTimer() {
        
        if updatingRoleTimeArray[7] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[7].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[7]), role: 7)
            
            score += multiplier[7] * roleBase[7] * rolesOwned[7]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[7] = startingRoleTimeArray[7]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[7].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[7]), role: 7)
            updatingRoleTimeArray[7] -= 1
            
        }
        
    }
    
    func updateDistinguishedTimer() {
        
        if updatingRoleTimeArray[8] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[8].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[8]), role: 8)
            
            score += multiplier[8] * roleBase[8] * rolesOwned[8]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[8] = startingRoleTimeArray[8]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[8].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[8]), role: 8)
            updatingRoleTimeArray[8] -= 1
            
        }
        
    }
    
    func updateSuperDistinguishedTimer() {
        
        if updatingRoleTimeArray[9] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[9].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[9]), role: 9)
            
            score += multiplier[9] * roleBase[9] * rolesOwned[9]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            updatingRoleTimeArray[9] = startingRoleTimeArray[9]
            
        } else {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[9].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[9]), role: 9)
            updatingRoleTimeArray[9] -= 1
            
        }
        
    }
    
    // Button to purchase a role, decrease the score by the purchase price of the role, increase purchase price
    // of role by 20%, update score label and UI
    func spendMoney(tag: Int) {
        
        score -= purchasePrice[tag]
        rolesOwned[tag] += 1
        purchasePrice[tag] *= 1.2
        scoreLbl.text = moneyFormatter(amount: Float(score))
        formatUI()
        
    }
    
    // Button to manually make money with a role
    func addMoney(tag: Int) {
        
        // Increment the number of times tapped for given role by 1
        timesTapped[tag] += 0.1
        
        // If the progress bar has filled up, increment score by the amount for the role, update score label
        // then reset the progress bar back to 0
        if progressBar[tag].progress == 1.0 {
            score += multiplier[tag] * roleBase[tag] * rolesOwned[tag]
            scoreLbl.text = moneyFormatter(amount: Float(score))
            
            formatUI()
            progressBar[tag].progress = 0
            
        // If the progress bar isn't full, increment it
        } else {
            progressBar[tag].progress += 0.1
        }
        
    }
    
    // Helper function to format the score into a currency String
    func moneyFormatter(amount: Float) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: amount))!
        
    }
    
    // Format images into circles (technically slight ovals since width and height aren't quite equal)
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
    
    // Helper function to only display views that are active (score is high enough to purchase them)
    // plus a 50% grayed out preview of the next role
    func formatUI() {
        
       for role in 1...9 {
            
        if score >= purchasePrice[role] {
                
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
    
    // Show and enable the role purchase button if score is high enough, otherwise disable it
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
    
    // Keep track of number of roles owned and update the button label with the number
    func formatbuttonLbl() {
    
        for role in 0...9 {
    
            if rolesOwned[role] >= 1 {
                
                buttonLbl[role].isEnabled = true
                rolesOwnedLbl[role].text = "\(rolesOwned[role])"
                
            } else {
                
                buttonLbl[role].isEnabled = false
                
            }
    
        }
    
    }
    
    // Set initial UIView formatting when the game is first loaded
    func initialFormat() {
        for role in 0...9 {
            timerBar[role].isHidden = true
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
    
    // Helper function for tracking and updating the timer progress bar
    func updateTimerProgressBar(progress: Int, role: Int) -> Float {
        
        // REVIEW - THIS MAY CAUSE PROBLEMS WITH TIMER
        var progressStatus: Float = 0.0
        
        progressStatus = 1 - (Float(updatingRoleTimeArray[role]) * 0.01)
        
        return progressStatus
        
    }

}
