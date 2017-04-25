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
    
    func configureCell(score:Float) {
        scoreLbl.text = "\(score)"
    }
    
    
}
