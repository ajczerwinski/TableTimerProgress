//
//  JobCell.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/19/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit

class JobCell: UITableViewCell {
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var roleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var jobBtnLbl: UIButton!
    
    var timesTapped: Float = 0.0
    

    override func awakeFromNib() {
        super.awakeFromNib()
        mainImg.layer.cornerRadius = mainImg.frame.height / 2
        mainImg.clipsToBounds = true
        
        progressBar.progress = 0.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(image:UIImage, role:String, desc:String) {
        mainImg.image = image
        roleLbl.text = role
        descLbl.text = desc
    }
    
    @IBAction func jobButton(_ sender: UIButton) {
        
        timesTapped += 0.1
        
        progressBar.progress = timesTapped
        
        
    }
    
    

}
