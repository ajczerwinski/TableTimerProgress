//
//  JobsVC.swift
//  ClickDevTime
//
//  Created by Allen Czerwinski on 4/29/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//


import UIKit
import CoreData

class JobsVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Game Score Label
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    @IBOutlet weak var assistantsLbl: UILabel!
    
    // Button Label and UI Label Collections
    
    @IBOutlet var buttonLbl: [UIButton]!
    
    @IBOutlet var assistantButtonLbl: UIButton!
    
    @IBOutlet weak var assistantsAvailableLbl: UILabel!
    
    @IBOutlet var rolesOwnedLbl: [UILabel]!
    
    @IBOutlet var priceToPurchaseLbl: [UILabel]!
    
    @IBOutlet var numRoles: [UIButton]!
    
    @IBOutlet var roleView: [UIView]!
    
    // UI Images Collection
    
    @IBOutlet var roleImg: [UIImageView]!
    
    // Progress Bar Collections
    
    @IBOutlet var progressBar: [UIProgressView]!
    
    @IBOutlet var timerBar: [UIProgressView]!
    
    // Initialize Score model object
    var score = Score()
    
    // Images for roles
    var roleImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restoreFromDefaults()
        
//        let savedRunningScore = Score.defaults.value(forKey: "runningScore") as? Double
//        let numberOfStudentsPurchased = Score.defaults.value(forKey: "rolesOwned") as? [Double]
//        if numberOfStudentsPurchased != nil {
//            print("This is the number of roles purchased: \(numberOfStudentsPurchased![0])")
//        }
        
//        if savedRunningScore != nil {
//            scoreLbl.text = scoreFormatter(amount: savedRunningScore!)
//            score.runningScore = savedRunningScore!
//        }
        
        formatImages()
        initialFormat()
        
        
    }
    
    // UIButton to increment the progress bar for roles to increase the score
    @IBAction func gameButton(_ sender: UIButton) {
        let buttonTag = sender.tag
        
        addMoney(tag: buttonTag)
        
        trackAvailableAssistants()
    }
    
    // UIButton to purchase roles
    @IBAction func purchaseRole(_ sender: UIButton) {
        
        let buttonTag = sender.tag
        
        spendMoney(tag: buttonTag)
        
        let timeCounter: Int = Int(score.rolesOwned[buttonTag])
        
        toggleTimer(counter: timeCounter, buttonTag: buttonTag, repeats: true)
        
    }
    
    func toggleTimer(counter: Int, buttonTag: Int, repeats: Bool) {
        
        if counter == 25 {
            progressBar[buttonTag].isHidden = true
            timerBar[buttonTag].isHidden = false
            
            // Activate role timer based on which buttonTag is selected
            switch buttonTag {
            case 0:
                if !repeats {
                    score.timer[0].invalidate()
                    return
                    
                } else {
                    score.timer[0] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateStudentTimer)), userInfo: nil, repeats: repeats)
                }
                
            case 1:
                if !repeats {
                    score.timer[1].invalidate()
                    return
                    
                } else {
                    score.timer[1] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateInternTimer)), userInfo: nil, repeats: repeats)
                }
            case 2:
                if !repeats {
                    score.timer[2].invalidate()
                    return
                    
                } else {
                    score.timer[2] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateJuniorTimer)), userInfo: nil, repeats: repeats)
                }
            case 3:
                if !repeats {
                    score.timer[3].invalidate()
                    
                } else {
                    score.timer[3] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateDevTimer)), userInfo: nil, repeats: repeats)
                }
            case 4:
                if !repeats {
                    score.timer[4].invalidate()
                    
                } else {
                    score.timer[4] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSeniorTimer)), userInfo: nil, repeats: repeats)
                }
            case 5:
                if !repeats {
                    score.timer[5].invalidate()
                    
                } else {
                    score.timer[5] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateLeadTimer)), userInfo: nil, repeats: repeats)
                }
            case 6:
                if !repeats {
                    score.timer[6].invalidate()
                    
                } else {
                    score.timer[6] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateStaffTimer)), userInfo: nil, repeats: repeats)
                }
            case 7:
                if !repeats {
                    score.timer[7].invalidate()
                    
                } else {
                    score.timer[7] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSeniorStaffTimer)), userInfo: nil, repeats: repeats)
                }
            case 8:
                if !repeats {
                    score.timer[8].invalidate()
                    
                } else {
                    score.timer[8] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateDistinguishedTimer)), userInfo: nil, repeats: repeats)
                }
            case 9:
                if !repeats {
                    score.timer[9].invalidate()
                    
                } else {
                    score.timer[9] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSuperDistinguishedTimer)), userInfo: nil, repeats: repeats)
                }
            default:
                return
            }
            
        }
        
        
    }
    
    // Helper function for rounding score to nearest 2 decimal places
    // and adding a label to help user track score amount rather than show
    // very large and unwieldy numbers
    func scoreFormatter(amount: Double) -> String {
        var subScore = 0.0
        var scoreString = ""
        
        switch amount {
            
        case 0..<1000:
            scoreString = "$" + String(format: "%.2f", amount)
        case 1001..<1000000:
            subScore = amount / 1000
            scoreString = "$" + String(format: "%.2f", subScore) + "K"
        case 1000001..<1000000000:
            subScore = amount / 1000000
            scoreString = "$" + String(format: "%.2f", subScore) + "M"
        case 1000000001..<1000000000000:
            subScore = amount / 1000000000
            scoreString = "$" + String(format: "%.2f", subScore) + "B"
        case 1000000000001..<1000000000000000:
            subScore = amount / 1000000000000
            scoreString = "$" + String(format: "%.2f", subScore) + "T"
        case 1000000000000001..<1000000000000000000:
            subScore = amount / 1000000000000000
            scoreString = "$" + String(format: "%.2f", subScore) + "Qa"
        default:
            return scoreString
        }
        
        return scoreString
    }
    
    // Role-specific timer functions to update score labels and timer progress bars for respective roles
    
    @objc func updateStudentTimer() {
        
        // If the countdown reaches 0, add score and reset countdown timer to original
        if score.updatingRoleTimeArray[0] < 1 {
            
            //timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar[0].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[0]), role: 0)
            
            score.runningScore += score.multiplier[0] * score.roleBase[0] * score.rolesOwned[0] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[0] * score.roleBase[0] * score.rolesOwned[0] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[0] = score.startingRoleTimeArray[0]
            trackAvailableAssistants()
            formatUI()
            
            // If countdown timer is 1 or higher, update timer progressBar and decrement countdown timer by 1
        } else {
            
            timerBar[0].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[0]), role: 0)
            score.updatingRoleTimeArray[0] -= 1
            
        }
        
    }

    @objc func updateInternTimer() {
        
        if score.updatingRoleTimeArray[1] < 1 {
            
            timerBar[1].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[1]), role: 1)
            score.runningScore += score.multiplier[1] * score.roleBase[1] * score.rolesOwned[1] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[1] * score.roleBase[1] * score.rolesOwned[1] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[1] = score.startingRoleTimeArray[1]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[1].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[1]), role: 1)
            score.updatingRoleTimeArray[1] -= 1
            
        }
        
    }
    
    @objc func updateJuniorTimer() {
        
        if score.updatingRoleTimeArray[2] < 1 {
            
            timerBar[2].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[2]), role: 2)
            
            score.runningScore += score.multiplier[2] * score.roleBase[2] * score.rolesOwned[2] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[2] * score.roleBase[2] * score.rolesOwned[2] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[2] = score.startingRoleTimeArray[2]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[2].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[2]), role: 2)
            score.updatingRoleTimeArray[2] -= 1
            
        }
        
    }
    
    @objc func updateDevTimer() {
        
        if score.updatingRoleTimeArray[3] < 1 {
            
            timerBar[3].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[3]), role: 3)
            
            score.runningScore += score.multiplier[3] * score.roleBase[3] * score.rolesOwned[3] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[3] * score.roleBase[3] * score.rolesOwned[3] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[3] = score.startingRoleTimeArray[3]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[3].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[3]), role: 3)
            score.updatingRoleTimeArray[3] -= 1
            
        }
        
    }
    
    @objc func updateSeniorTimer() {
        
        if score.updatingRoleTimeArray[4] < 1 {
            
            timerBar[4].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[4]), role: 4)
            
            score.runningScore += score.multiplier[4] * score.roleBase[4] * score.rolesOwned[4] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[4] * score.roleBase[4] * score.rolesOwned[4] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[4] = score.startingRoleTimeArray[4]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[4].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[4]), role: 4)
            score.updatingRoleTimeArray[4] -= 1
            
        }
        
    }
    
    @objc func updateLeadTimer() {
        
        if score.updatingRoleTimeArray[5] < 1 {
            
            timerBar[5].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[5]), role: 5)
            
            score.runningScore += score.multiplier[5] * score.roleBase[5] * score.rolesOwned[5] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[5] * score.roleBase[5] * score.rolesOwned[5] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[5] = score.startingRoleTimeArray[5]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[5].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[5]), role: 5)
            score.updatingRoleTimeArray[5] -= 1
            
        }
        
    }
    
    @objc func updateStaffTimer() {
        
        if score.updatingRoleTimeArray[6] < 1 {
            
            timerBar[6].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[6]), role: 6)
            
            score.runningScore += score.multiplier[6] * score.roleBase[6] * score.rolesOwned[6] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[6] * score.roleBase[6] * score.rolesOwned[6] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[6] = score.startingRoleTimeArray[6]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[6].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[6]), role: 6)
            score.updatingRoleTimeArray[6] -= 1
            
        }
        
    }
    
    @objc func updateSeniorStaffTimer() {
        
        if score.updatingRoleTimeArray[7] < 1 {
            
            timerBar[7].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[7]), role: 7)
            
            score.runningScore += score.multiplier[7] * score.roleBase[7] * score.rolesOwned[7] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[7] * score.roleBase[7] * score.rolesOwned[7] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[7] = score.startingRoleTimeArray[7]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[7].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[7]), role: 7)
            score.updatingRoleTimeArray[7] -= 1
            
        }
        
    }
    
    @objc func updateDistinguishedTimer() {
        
        if score.updatingRoleTimeArray[8] < 1 {
            
            timerBar[8].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[8]), role: 8)
            
            score.runningScore += score.multiplier[8] * score.roleBase[8] * score.rolesOwned[8] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[8] * score.roleBase[8] * score.rolesOwned[8] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[8] = score.startingRoleTimeArray[8]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[8].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[8]), role: 8)
            score.updatingRoleTimeArray[8] -= 1
            
        }
        
    }
    
    @objc func updateSuperDistinguishedTimer() {
        
        if score.updatingRoleTimeArray[9] < 1 {
            
            timerBar[9].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[9]), role: 9)
            
            score.runningScore += score.multiplier[9] * score.roleBase[9] * score.rolesOwned[9] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[9] * score.roleBase[9] * score.rolesOwned[9] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            score.updatingRoleTimeArray[9] = score.startingRoleTimeArray[9]
            trackAvailableAssistants()
            formatUI()
            
        } else {
            
            timerBar[9].progress = updateTimerProgressBar(progress: Int(score.updatingRoleTimeArray[9]), role: 9)
            score.updatingRoleTimeArray[9] -= 1
            
        }
        
    }
    
    func updateTimerProgressBar(progress: Int, role: Int) -> Float {
        
        var progressStatus: Float = 0.0
        progressStatus = 1 - Float(score.updatingRoleTimeArray[role] / score.startingRoleTimeArray[role])
        
        return progressStatus
        
    }
    
    // Button to purchase a role, decrease the score by the purchase price of the role, increase purchase price
    // of role by 20%, update score label and UI
    func spendMoney(tag: Int) {
        
        score.runningScore -= score.purchasePrice[tag]
        score.rolesOwned[tag] += 1
        score.purchasePrice[tag] *= 1.2
        scoreLbl.text = scoreFormatter(amount: score.runningScore)
        formatUI()
        
    }
    
    // Manually make money with a role
    func addMoney(tag: Int) {
        
        // Increment the number of times tapped for given role by 1
        score.timesTapped[tag] += 0.1
        
        // If the progress bar has filled up, increment score by the amount for the role, update score label
        // then reset the progress bar back to 0
        if progressBar[tag].progress == 1.0 {
            score.runningScore += score.multiplier[tag] * score.roleBase[tag] * score.rolesOwned[tag] * score.assistantsPurchasedMultiplier
            score.totalScore += score.multiplier[tag] * score.roleBase[tag] * score.rolesOwned[tag] * score.assistantsPurchasedMultiplier
            scoreLbl.text = scoreFormatter(amount: score.runningScore)
            
            formatUI()
            progressBar[tag].progress = 0
            
            // If the progress bar isn't full, increment it
        } else {
            progressBar[tag].progress += 0.1
        }
        
    }
    
    
    
    // Format images into ovals
    func formatImages() {
        
        for role in 0...9 {
            
            numRoles[role].layer.cornerRadius = numRoles[role].frame.height / 2
            numRoles[role].clipsToBounds = true
            
        }
        
        formatUI()
        
    }
    
    // Helper function to only display views that are active (score is high enough to purchase them)
    // plus a 50% grayed out preview of the next role
    func formatUI() {
        
        for role in 1...9 {
            
            if score.runningScore >= score.purchasePrice[role] {
                
                score.isRoleEnabled[role] = true
                
                buttonLbl[role].isEnabled = score.isRoleEnabled[role]
                buttonLbl[role].isHidden = !score.isRoleEnabled[role]
                
                
                
                roleView[role].alpha = 1.0
            } else if (!score.isRoleEnabled[role] && score.isRoleEnabled[role - 1]) {
                
                roleView[role].alpha = 0.5
                buttonLbl[role].isHidden = true
                buttonLbl[role].isEnabled = false
                
                
                
            } else if !score.isRoleEnabled[role] {
                
                roleView[role].alpha = 0
                buttonLbl[role].isHidden = true
                numRoles[role].isHidden = true
                
            }
            
        }
        
        formatPurchaseBtn()
        formatbuttonLbl()
        manageAssistantsAvailableBtnAndLbl()
        
    }
    
    // Show and enable the role purchase button if score is high enough, otherwise disable it
    func formatPurchaseBtn() {
        
        for role in 0...9 {
            
            if score.runningScore >= score.purchasePrice[role] {
                
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
            
            if score.rolesOwned[role] >= 1 {
                
                buttonLbl[role].isEnabled = true
                rolesOwnedLbl[role].text = "\(Int(score.rolesOwned[role]))"
                priceToPurchaseLbl[role].text = scoreFormatter(amount: score.purchasePrice[role])
                
            } else {
                
                buttonLbl[role].isEnabled = false
                
            }
            
        }
        
    }
    
    // Set initial UIView formatting when the game is first loaded
    func initialFormat() {
        for role in 0...9 {
            timerBar[role].isHidden = true
            
        }
        score.isRoleEnabled[0] = true
        buttonLbl[0].isEnabled = score.isRoleEnabled[0]
        buttonLbl[0].isHidden = !score.isRoleEnabled[0]
        roleView[0].alpha = 1.0
        
        roleView[1].alpha = 0.5
        buttonLbl[1].isEnabled = false
        buttonLbl[1].isHidden = true
        
        manageAssistantsAvailableBtnAndLbl()
        
    }
    
    // Helper function to increment assistants available and increase
    // assistantPrice if score is >= assistantPrice
    func trackAvailableAssistants() {
        while score.totalScore >= score.assistantPrice {
            score.assistantsAvailable += 1
            score.assistantPrice *= 1.1
        }
        
        manageAssistantsAvailableBtnAndLbl()
    }
    
    func manageAssistantsAvailableBtnAndLbl() {
        let intAvailableAssistants = Int(score.assistantsAvailable)
        
        if intAvailableAssistants < 1 {
            assistantButtonLbl.isHidden = true
            assistantsAvailableLbl.text = ""
        } else if intAvailableAssistants == 1 {
            assistantsAvailableLbl.isHidden = false
            assistantButtonLbl.isHidden = false
            assistantsAvailableLbl.text = "\(intAvailableAssistants) assistant"
        } else {
            assistantButtonLbl.isHidden = false
            assistantsAvailableLbl.text = "\(intAvailableAssistants) assistants"
        }
        
    }
    
    @IBAction func assistantsResetBtn(_ sender: UIButton) {
        
        /*if assistantsAvailable < 1 {
         let assistantsAlert = UIAlertController(title: "No Assistants", message: "You can't reset assistants until you have some available!", preferredStyle: UIAlertControllerStyle.alert)
         assistantsAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
         self.dismiss(animated: true, completion: nil)
         }))
         present(assistantsAlert, animated: true, completion: nil)
         } else {*/
        score.rolesOwned = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        score.timesTapped = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        score.multiplier = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        score.isRoleEnabled = [true, false, false, false, false, false, false, false, false, false]
        score.purchasePrice = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000]
        score.assistantsPurchased = score.assistantsAvailable + score.assistantsPurchased
        score.assistantsAvailable = 0
        score.assistantsPurchasedMultiplier = (1 + score.assistantsPurchased / 100)
        score.runningScore = 0
        score.totalScore = 0
        scoreLbl.text = scoreFormatter(amount: score.runningScore)
        let formattedAssistantsPurchased = Int(score.assistantsPurchased)
        assistantsLbl.text = "\(formattedAssistantsPurchased) assistants"
        
        for role in 0...9 {
            
            toggleTimer(counter: 25, buttonTag: role, repeats: false)
            progressBar[role].progress = 0.0
            progressBar[role].isHidden = false
            timerBar[role].progress = 0.0
            rolesOwnedLbl[role].text = "\(Int(score.rolesOwned[role]))"
            priceToPurchaseLbl[role].text = scoreFormatter(amount: score.purchasePrice[role])
            score.updatingRoleTimeArray[role] = score.startingRoleTimeArray[role]
            score.timer[role].invalidate()
        }
        formatImages()
        initialFormat()
        formatUI()
        formatbuttonLbl()
        formatPurchaseBtn()
    }
    
    func restoreFromDefaults() {
        
        guard let savedRunningScore = Score.defaults.value(forKey: "runningScore") as? Double else {
            print("Couldn't get defaults for runningScore")
            return
        }
        
        scoreLbl.text = scoreFormatter(amount: savedRunningScore)
        score.runningScore = savedRunningScore
        
        guard let savedRolesOwned = Score.defaults.value(forKey: "rolesOwned") as? [Double] else {
            print("Couldn't get defaults for rolesOwned")
            return
        }
        score.rolesOwned = savedRolesOwned
        
        guard let savedTimesTapped = Score.defaults.value(forKey: "timesTapped") as? [Double] else {
            print("Couldn't get defaults for timesTapped")
            return
        }
        score.timesTapped = savedTimesTapped
        
        guard let savedMultiplier = Score.defaults.value(forKey: "multiplier") as? [Double] else {
            print("Couldn't get defaults for multiplier")
            return
        }
        score.multiplier = savedMultiplier
        
        guard let savedIsRoleEnabled = Score.defaults.value(forKey: "isRoleEnabled") as? [Bool] else {
            print("Couldn't get defaults for isRoleEnabled")
            return
        }
        score.isRoleEnabled = savedIsRoleEnabled
        
        guard let savedPurchasePrice = Score.defaults.value(forKey: "purchasePrice") as? [Double] else {
            print("Couldn't get defaults for purchasePrice")
            return
        }
        score.purchasePrice = savedPurchasePrice
        
        guard let savedAssistantsPurchased = Score.defaults.value(forKey: "assistantsPurchased") as? Double else {
            print("Couldn't get defaults for assistantsPurchased")
            return
        }
        score.assistantsPurchased = savedAssistantsPurchased
        
        guard let savedAssistantsAvailable = Score.defaults.value(forKey: "assistantsAvailable") as? Double else {
            print("Couldn't get defaults for assistantsAvailable")
            return
        }
        score.assistantsAvailable = savedAssistantsAvailable
        
        guard let savedAssistantsPurchasedMultiplier = Score.defaults.value(forKey: "assistantsPurchasedMultiplier") as? Double else {
            print("Couldn't get defaults for assistantsPurchasedMultiplier")
            return
        }
        score.assistantsPurchasedMultiplier = savedAssistantsPurchasedMultiplier
        
        guard let savedTotalScore = Score.defaults.value(forKey: "totalScore") as? Double else {
            print("Couldn't get defaults for totalScore")
            return
        }
        score.totalScore = savedTotalScore
        
        formatImages()
        formatUI()
        formatbuttonLbl()
        formatPurchaseBtn()
        
    }
    
    
}
