//
//  JobsViewController.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/22/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit
import CoreData

class JobsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var assistantController: NSFetchedResultsController<Assistant>!
    var roleController: NSFetchedResultsController<Role>!
    var scoreController: NSFetchedResultsController<Score>!
    
    var icRoles = ["student", "intern", "junior developer", "developer", "senior developer", "lead developer", "staff engineer", "senior staff engineer", "distinguished engineer", "super distinguished engineer"]
    
    var icDescriptions = ["just tryin' to learn", "get a taste of work life", "bottom of the totem pole", "finally credible", "really hitting your stride", "you're in charge now", "build critical components", "build critical major tech", "industry expert", "time for that acm award"]
    
    var icImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
    
    var playerScore: Float = 0.0
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        attemptFetch()
        
        setBackground()
        
    }
    
    /*
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
        
        var timer: [Timer] = [Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer(), Timer()]
        
        // Array of Doubles to store original countdown number to reset when counter gets to 0
        var startingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
        
        // Array of Doubles to store countdown timer numbers
        var updatingRoleTimeArray: [Double] = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
        
        var assistantPrice: Double = 1000000
        
        var runningScore: Double = 0.0
        
        var totalScore: Double = 0.0
        
        var assistantsAvailable: Double = 0.0
        
        var assistantsPurchased: Double = 0.0
        
        var assistantsPurchasedMultiplier: Double = 1.0
        
        var roleImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
        
        // Store # of times tapped for each role
        
        var timesTapped: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // Multiplier for each role
        var multiplier: [Double] = [100000000000, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        
        // Array of Bools to determine if role should be visible/active or not
        var isRoleEnabled: [Bool] = [true, false, false, false, false, false, false, false, false, false]
        
        // Purchase price for each role
        var purchasePrice: [Double] = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000]
        
        // Base score that each role gives when progressBar or progressTimer completes
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
            
            trackAvailableAssistants()
        }
        
        // UIButton to purchase roles
        @IBAction func purchaseRole(_ sender: UIButton) {
            
            let buttonTag = sender.tag
            
            spendMoney(tag: buttonTag)
            
            // If more 25 or more of a given role are owned, disable clickable progress bar enable timer
            let timeCounter: Int = Int(rolesOwned[buttonTag])
            
            toggleTimer(counter: timeCounter, buttonTag: buttonTag, repeats: true)
            
            print(rolesOwned)
            
        }
        
        func toggleTimer(counter: Int, buttonTag: Int, repeats: Bool) {
            
            if counter == 25 {
                progressBar[buttonTag].isHidden = true
                timerBar[buttonTag].isHidden = false
                
                // Activate role timer based on which buttonTag is selected
                // TODO - rewrite this to pass a parameter through with the selector function to obviate
                // need to use switch statement and individual update timer functions
                switch buttonTag {
                case 0:
                    if !repeats {
                        timer[0].invalidate()
                        return
                        
                    } else {
                        timer[0] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateStudentTimer)), userInfo: nil, repeats: repeats)
                    }
                    
                case 1:
                    if !repeats {
                        timer[1].invalidate()
                        return
                        
                    } else {
                        timer[1] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateInternTimer)), userInfo: nil, repeats: repeats)
                    }
                case 2:
                    if !repeats {
                        timer[2].invalidate()
                        return
                        
                    } else {
                        timer[2] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateJuniorTimer)), userInfo: nil, repeats: repeats)
                    }
                case 3:
                    if !repeats {
                        timer[3].invalidate()
                        
                    } else {
                        timer[3] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateDevTimer)), userInfo: nil, repeats: repeats)
                    }
                case 4:
                    if !repeats {
                        timer[4].invalidate()
                        
                    } else {
                        timer[4] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSeniorTimer)), userInfo: nil, repeats: repeats)
                    }
                case 5:
                    if !repeats {
                        timer[5].invalidate()
                        
                    } else {
                        timer[5] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateLeadTimer)), userInfo: nil, repeats: repeats)
                    }
                case 6:
                    if !repeats {
                        timer[6].invalidate()
                        
                    } else {
                        timer[6] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateStaffTimer)), userInfo: nil, repeats: repeats)
                    }
                case 7:
                    if !repeats {
                        timer[7].invalidate()
                        
                    } else {
                        timer[7] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSeniorStaffTimer)), userInfo: nil, repeats: repeats)
                    }
                case 8:
                    if !repeats {
                        timer[8].invalidate()
                        
                    } else {
                        timer[8] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateDistinguishedTimer)), userInfo: nil, repeats: repeats)
                    }
                case 9:
                    if !repeats {
                        timer[9].invalidate()
                        
                    } else {
                        timer[9] = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateSuperDistinguishedTimer)), userInfo: nil, repeats: repeats)
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
        // TODO - refactor these into one function that takes a parameter from the purchaseRole function above
        func updateStudentTimer() {
            
            // If the countdown reaches 0, add score and reset countdown timer to original
            if updatingRoleTimeArray[0] < 1 {
                
                //timerLbl.text = timerProgressFormatter(text: tenths)
                timerBar[0].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[0]), role: 0)
                
                runningScore += multiplier[0] * roleBase[0] * rolesOwned[0] * assistantsPurchasedMultiplier
                totalScore += multiplier[0] * roleBase[0] * rolesOwned[0] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[0] = startingRoleTimeArray[0]
                trackAvailableAssistants()
                
                // If countdown timer is 1 or higher, update timer progressBar and decrement countdown timer by 1
            } else {
                
                timerBar[0].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[0]), role: 0)
                updatingRoleTimeArray[0] -= 1
                
            }
            
        }
        
        func updateInternTimer() {
            
            if updatingRoleTimeArray[1] < 1 {
                
                timerBar[1].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[1]), role: 1)
                runningScore += multiplier[1] * roleBase[1] * rolesOwned[1] * assistantsPurchasedMultiplier
                totalScore += multiplier[1] * roleBase[1] * rolesOwned[1] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[1] = startingRoleTimeArray[1]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[1].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[1]), role: 1)
                updatingRoleTimeArray[1] -= 1
                
            }
            
        }
        
        func updateJuniorTimer() {
            
            if updatingRoleTimeArray[2] < 1 {
                
                timerBar[2].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[2]), role: 2)
                
                runningScore += multiplier[2] * roleBase[2] * rolesOwned[2] * assistantsPurchasedMultiplier
                totalScore += multiplier[2] * roleBase[2] * rolesOwned[2] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[2] = startingRoleTimeArray[2]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[2].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[2]), role: 2)
                updatingRoleTimeArray[2] -= 1
                
            }
            
        }
        
        func updateDevTimer() {
            
            if updatingRoleTimeArray[3] < 1 {
                
                timerBar[3].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[3]), role: 3)
                
                runningScore += multiplier[3] * roleBase[3] * rolesOwned[3] * assistantsPurchasedMultiplier
                totalScore += multiplier[3] * roleBase[3] * rolesOwned[3] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[3] = startingRoleTimeArray[3]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[3].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[3]), role: 3)
                updatingRoleTimeArray[3] -= 1
                
            }
            
        }
        
        func updateSeniorTimer() {
            
            if updatingRoleTimeArray[4] < 1 {
                
                timerBar[4].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[4]), role: 4)
                
                runningScore += multiplier[4] * roleBase[4] * rolesOwned[4] * assistantsPurchasedMultiplier
                totalScore += multiplier[4] * roleBase[4] * rolesOwned[4] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[4] = startingRoleTimeArray[4]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[4].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[4]), role: 4)
                updatingRoleTimeArray[4] -= 1
                
            }
            
        }
        
        func updateLeadTimer() {
            
            if updatingRoleTimeArray[5] < 1 {
                
                timerBar[5].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[5]), role: 5)
                
                runningScore += multiplier[5] * roleBase[5] * rolesOwned[5] * assistantsPurchasedMultiplier
                totalScore += multiplier[5] * roleBase[5] * rolesOwned[5] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[5] = startingRoleTimeArray[5]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[5].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[5]), role: 5)
                updatingRoleTimeArray[5] -= 1
                
            }
            
        }
        
        func updateStaffTimer() {
            
            if updatingRoleTimeArray[6] < 1 {
                
                timerBar[6].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[6]), role: 6)
                
                runningScore += multiplier[6] * roleBase[6] * rolesOwned[6] * assistantsPurchasedMultiplier
                totalScore += multiplier[6] * roleBase[6] * rolesOwned[6] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[6] = startingRoleTimeArray[6]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[6].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[6]), role: 6)
                updatingRoleTimeArray[6] -= 1
                
            }
            
        }
        
        func updateSeniorStaffTimer() {
            
            if updatingRoleTimeArray[7] < 1 {
                
                timerBar[7].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[7]), role: 7)
                
                runningScore += multiplier[7] * roleBase[7] * rolesOwned[7] * assistantsPurchasedMultiplier
                totalScore += multiplier[7] * roleBase[7] * rolesOwned[7] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[7] = startingRoleTimeArray[7]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[7].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[7]), role: 7)
                updatingRoleTimeArray[7] -= 1
                
            }
            
        }
        
        func updateDistinguishedTimer() {
            
            if updatingRoleTimeArray[8] < 1 {
                
                timerBar[8].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[8]), role: 8)
                
                runningScore += multiplier[8] * roleBase[8] * rolesOwned[8] * assistantsPurchasedMultiplier
                totalScore += multiplier[8] * roleBase[8] * rolesOwned[8] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[8] = startingRoleTimeArray[8]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[8].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[8]), role: 8)
                updatingRoleTimeArray[8] -= 1
                
            }
            
        }
        
        func updateSuperDistinguishedTimer() {
            
            if updatingRoleTimeArray[9] < 1 {
                
                timerBar[9].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[9]), role: 9)
                
                runningScore += multiplier[9] * roleBase[9] * rolesOwned[9] * assistantsPurchasedMultiplier
                totalScore += multiplier[9] * roleBase[9] * rolesOwned[9] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                updatingRoleTimeArray[9] = startingRoleTimeArray[9]
                trackAvailableAssistants()
                
            } else {
                
                timerBar[9].progress = updateTimerProgressBar(progress: Int(updatingRoleTimeArray[9]), role: 9)
                updatingRoleTimeArray[9] -= 1
                
            }
            
        }
        
        func updateTimerProgressBar(progress: Int, role: Int) -> Float {
            
            // REVIEW - THIS MAY CAUSE PROBLEMS WITH TIMER
            var progressStatus: Float = 0.0
            progressStatus = 1 - Float(updatingRoleTimeArray[role] / startingRoleTimeArray[role])
            print(progressStatus)
            
            return progressStatus
            
        }
        
        // Button to purchase a role, decrease the score by the purchase price of the role, increase purchase price
        // of role by 20%, update score label and UI
        func spendMoney(tag: Int) {
            
            runningScore -= purchasePrice[tag]
            rolesOwned[tag] += 1
            purchasePrice[tag] *= 1.2
            scoreLbl.text = scoreFormatter(amount: runningScore)
            formatUI()
            
        }
        
        // Button to manually make money with a role
        func addMoney(tag: Int) {
            
            // Increment the number of times tapped for given role by 1
            timesTapped[tag] += 0.1
            
            // If the progress bar has filled up, increment score by the amount for the role, update score label
            // then reset the progress bar back to 0
            if progressBar[tag].progress == 1.0 {
                runningScore += multiplier[tag] * roleBase[tag] * rolesOwned[tag] * assistantsPurchasedMultiplier
                totalScore += multiplier[tag] * roleBase[tag] * rolesOwned[tag] * assistantsPurchasedMultiplier
                scoreLbl.text = scoreFormatter(amount: runningScore)
                
                formatUI()
                progressBar[tag].progress = 0
                
                // If the progress bar isn't full, increment it
            } else {
                progressBar[tag].progress += 0.1
            }
            
        }
        
        // Helper function to format the score into a currency String
        /*func moneyFormatter(amount: Float) -> String {
         
         let formatter = NumberFormatter()
         formatter.numberStyle = .currency
         
         return formatter.string(from: NSNumber(value: amount))!
         
         }*/
        
        
        
        // Format images into circles (technically slight ovals since width and height aren't quite equal)
        func formatImages() {
            
            for role in 0...9 {
                
                /*roleImg[role].image = roleImages[role]
                 roleImg[role].layer.cornerRadius = roleImg[role].frame.height / 2
                 roleImg[role].clipsToBounds = true*/
                
                numRoles[role].layer.cornerRadius = numRoles[role].frame.height / 2
                numRoles[role].clipsToBounds = true
                
            }
            
            formatUI()
            
        }
        
        // Helper function to only display views that are active (score is high enough to purchase them)
        // plus a 50% grayed out preview of the next role
        func formatUI() {
            
            for role in 1...9 {
                
                if runningScore >= purchasePrice[role] {
                    
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
                
                if runningScore >= purchasePrice[role] {
                    
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
                    rolesOwnedLbl[role].text = "\(Int(rolesOwned[role]))"
                    priceToPurchaseLbl[role].text = scoreFormatter(amount: purchasePrice[role])
                    
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
            
            manageAssistantsAvailableBtnAndLbl()
            
        }
        
        // Helper function to increment assistants available and increase
        // assistantPrice if score is >= assistantPrice
        func trackAvailableAssistants() {
            while totalScore >= assistantPrice {
                assistantsAvailable += 1
                assistantPrice *= 1.1
            }
            
            manageAssistantsAvailableBtnAndLbl()
            //assistantButtonLbl.setTitle("Get \(Int(assistantsAvailable)) assistants", for: .normal)
        }
        
        func manageAssistantsAvailableBtnAndLbl() {
            let intAvailableAssistants = Int(assistantsAvailable)
            
            if intAvailableAssistants == 1 {
                assistantsAvailableLbl.isHidden = false
                assistantButtonLbl.isHidden = false
                assistantsAvailableLbl.text = "\(intAvailableAssistants) assistant"
            } else {
                assistantsAvailableLbl.text = "\(intAvailableAssistants) assistants"
            }
            print("\(intAvailableAssistants)")
        }
        
        @IBAction func assistantsResetBtn(_ sender: UIButton) {
            
            rolesOwned = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            timesTapped = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            multiplier = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
            isRoleEnabled = [true, false, false, false, false, false, false, false, false, false]
            purchasePrice = [1, 10, 50, 100, 500, 1200, 30000, 400000, 4000000, 10000000]
            assistantsPurchased = assistantsAvailable
            assistantsAvailable = 0
            assistantsPurchasedMultiplier = (1 + assistantsPurchased / 100)
            runningScore = 0
            totalScore = 0
            scoreLbl.text = scoreFormatter(amount: runningScore)
            let formattedAssistantsPurchased = Int(assistantsPurchased)
            assistantsLbl.text = "\(formattedAssistantsPurchased) assistants"
            
            for role in 0...9 {
                
                toggleTimer(counter: 25, buttonTag: role, repeats: false)
                progressBar[role].progress = 0.0
                progressBar[role].isHidden = false
                timerBar[role].progress = 0.0
                rolesOwnedLbl[role].text = "\(Int(rolesOwned[role]))"
                priceToPurchaseLbl[role].text = scoreFormatter(amount: purchasePrice[role])
                
                updatingRoleTimeArray[role] = startingRoleTimeArray[role]
                timer[role].invalidate()
                
            }
            
            formatImages()
            initialFormat()
            formatUI()
            formatbuttonLbl()
            formatPurchaseBtn()
            print(assistantsPurchasedMultiplier)
            
            
        }
        
    }*/

    
    

    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let returnCell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobCell
        
        //if indexPath.row == 0 {
            
            //let returnCell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            //var score = playerScore
            //returnCell.backgroundColor = UIColor.white
            //returnCell.mainImg.isHidden = true
            //returnCell.roleLbl.isHidden = true
            //returnCell.descLbl.isHidden = true
            //returnCell.scoreLbl.text = "\(playerScore + returnCell.scoreIncrementer)"
            //cell.configureCell(image: icImages[indexPath.row], role: icRoles[indexPath.row], desc: icDescriptions[indexPath.row])
            //return returnCell
            
        //} else {
            
            //let returnCell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobCell
            
            returnCell.backgroundColor = .clear
            returnCell.scoreLbl.text = "\(playerScore + returnCell.scoreIncrementer)"
            returnCell.configureCell(image: icImages[indexPath.row], role: icRoles[indexPath.row], desc: icDescriptions[indexPath.row])
            
            return returnCell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        
        return 0
        
    }
    
    /*func configureTitleCell(cell: TitleCell, indexPath: NSIndexPath) {
        
        if let score = fetchedResultsController.object(at: indexPath as IndexPath) as? Player {
            cell.configureTitleCell(player: score)
        }
        
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icRoles.count
    }
    
    func setBackground() {
        
        let imageView = UIImageView(frame: self.view.frame)
        let image = #imageLiteral(resourceName: "background")
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        self.tableView.addSubview(imageView)
        self.tableView.sendSubview(toBack: imageView)
        
    }
    
    func attemptFetch() {
        setFetchedResults()
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let error = error as NSError
            print("\(error), \(error.userInfo)")
        }
        
    }
    
    func setFetchedResults() {
        
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: ad.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        fetchedResultsController = controller
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    
    }
    
    /*func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! TitleCell
                configureTitleCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [indexPath!], with: .fade)
            }
            break
        }
        
    }*/
    
}
