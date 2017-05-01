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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatImages()
        
    }
    
    
    @IBAction func studentDevBtn(_ sender: UIButton) {
    }
    
    @IBAction func internDevBtn(_ sender: UIButton) {
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
        
        //progressBar.progress = 0.0
        
    }
    
}
