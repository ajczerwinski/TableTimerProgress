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
    
    func configureScore(score: Score) {
        scoreLbl.text = "\(score.runningScore)"
        
    }
    
    func configureAssistants(assistant: Assistant) {
        
        assistantsLbl.text = "\(assistant.numPurchased)"
        assistantsAvailableLbl.text = "\(assistant.numAvailable)"
    }
    
}
