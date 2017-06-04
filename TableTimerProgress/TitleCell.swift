//
//  TitleCell.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/25/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    @IBOutlet weak var assistantsLbl: UILabel!
    
    @IBOutlet weak var assistantsAvailableLbl: UILabel!
    
    var score = 0.0
    var price = 0.0
    
    var runningScore = 0.0
    var numAvailable = 0.0
    var numPurchased = 0.0
    
    
    
    func configureScore(score: Score) {
        scoreLbl.text = "\(score.runningScore)"
        
    }
    
    func configureAssistants(assistant: Assistant) {
        
        assistantsLbl.text = "\(assistant.numPurchased)"
        assistantsAvailableLbl.text = "\(assistant.numAvailable)"
    }
    
}
