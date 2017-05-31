//
//  JobCell.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/19/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit

class RoleCell: UITableViewCell {
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var roleTitleLbl: UILabel!
    @IBOutlet weak var roleDescLbl: UILabel!
    @IBOutlet weak var tapProgressBar: UIProgressView!
    @IBOutlet weak var timerProgressBar: UIProgressView!
    @IBOutlet weak var jobBtnLbl: UIButton!
    @IBOutlet weak var scoreLbl: UILabel!
    
    var timesTapped: Float = 0.0
    var scoreIncrementer: Float = 0.0
    

    override func awakeFromNib() {
        super.awakeFromNib()
        mainImg.layer.cornerRadius = mainImg.frame.height / 2
        mainImg.clipsToBounds = true
        
        tapProgressBar.progress = 0.0
        
        timerProgressBar.progress = 0.0
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(image:UIImage, role:String, desc:String) {
        mainImg.image = image
        roleTitleLbl.text = role
        roleDescLbl.text = desc
    }
    
    @IBAction func jobButton(_ sender: UIButton) {
        
        timesTapped += 0.1
        //scoreLbl.text = "\(playerScore)"
        
        if tapProgressBar.progress == 1.0 {
            //money += 1.0
            //moneyLbl.text = moneyFormatter(amount: Float(money))
            scoreIncrementer = 1.0
            tapProgressBar.progress = 0.0
            timesTapped = 0.0
        }
        
        tapProgressBar.progress = timesTapped
        
        
        
        
        
    }

}
