//
//  JobCell.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/19/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit
import CoreData

protocol DataSentDelegate {
    func sendDataToJobsVC(data: String)
}

class RoleCell: UITableViewCell {
    
    var delegate: DataSentDelegate? = nil
    
    // Role Cell outlets
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var roleTitleLbl: UILabel!
    @IBOutlet weak var roleDescLbl: UILabel!
    @IBOutlet weak var tapProgressBar: UIProgressView!
    @IBOutlet weak var timerProgressBar: UIProgressView!
    @IBOutlet weak var tapRoleBtnLbl: UIButton!
    @IBOutlet weak var purchaseRoleBtnLbl: UIButton!
    @IBOutlet weak var numRolesLbl: UILabel!
    @IBOutlet weak var priceToPurchaseLbl: UILabel!
    @IBOutlet weak var roleCellView: UIView!
    
    // Title Cell outlets
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var assistantsLbl: UILabel!
    @IBOutlet weak var assistantsAvailableLbl: UILabel!
    @IBOutlet weak var resetButtonLbl: UIButton!
    
    
    var timesTapped: Float = 0.0
    var scoreIncrementer: Float = 0.0
    
    var assistantClass: Assistant?
    var roleClass: Role?
    var roleIndex: Int?
    
    var scoreClass = Score.init(entity: NSEntityDescription.entity(forEntityName: "Score", in: context)!, insertInto: context)

    override func awakeFromNib() {
        super.awakeFromNib()
        purchaseRoleBtnLbl.layer.cornerRadius = mainImg.frame.height / 2
        purchaseRoleBtnLbl.clipsToBounds = true
        roleCellView.backgroundColor = UIColor(red: 17.0 / 255.0 , green: 146.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
        
        tapProgressBar.progress = 0.0
        
        timerProgressBar.progress = 0.0
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureRoleCell(image: UIImage, role: String, desc: String) {
        mainImg.image = image
        roleTitleLbl.text = role
        roleDescLbl.text = desc
        
    }
    
    func configureScoreCell(score: Double, assistants: Double, assistantsAvailable: Double) {
        
        scoreLbl.text = "\(score)"
        assistantsLbl.text = "\(assistants)"
        assistantsAvailableLbl.text = "\(assistantsAvailable)"
        
    }
    
    @IBAction func tapRoleBtn(_ sender: UIButton) {
        
        timesTapped += 0.1
        //scoreLbl.text = "\(playerScore)"
        
        if tapProgressBar.progress == 1.0 {
            //money += 1.0
            //moneyLbl.text = moneyFormatter(amount: Float(money))
            scoreIncrementer = 1.0
            tapProgressBar.progress = 0.0
            timesTapped = 0.0
            scoreClass.runningScore += scoreClass.scoreIncrementer(roleIndex: roleIndex!)
            //print("I'm the running score: \(scoreClass.runningScore)")
            //print("I'm the indexPath: \(roleIndex!)")
            print("\(scoreClass.runningScore)")
            /*var counter = scoreClass?.runningScore
            counter! + 1
            scoreClass!.runningScore += 1
            print(counter!)*/
            delegate?.sendDataToJobsVC(data: "Hi there")
            
        }
        
        tapProgressBar.progress = timesTapped
        
        
        
        
    }

    @IBAction func purchaseRoleBtn(_ sender: UIButton) {
        
        
        
    }
}
