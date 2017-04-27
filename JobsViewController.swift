//
//  JobsViewController.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/22/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit
import CoreData

class JobsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        setBackground()
        
    }
    
    var icRoles = ["student", "intern", "junior developer", "developer", "senior developer", "lead developer", "staff engineer", "senior staff engineer", "distinguished engineer", "super distinguished engineer"]
    
    var icDescriptions = ["just tryin' to learn", "get a taste of work life", "bottom of the totem pole", "finally credible", "really hitting your stride", "you're in charge now", "build critical components", "build critical major tech", "industry expert", "time for that acm award"]
    
    var icImages = [#imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let returnCell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            
            returnCell.backgroundColor = .clear
            returnCell.configureCell(score: 1.0)
            //cell.configureCell(image: icImages[indexPath.row], role: icRoles[indexPath.row], desc: icDescriptions[indexPath.row])
            return returnCell
            
        } else {
            
            let returnCell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobCell
            
            returnCell.backgroundColor = .clear
            returnCell.configureCell(image: icImages[indexPath.row], role: icRoles[indexPath.row], desc: icDescriptions[indexPath.row])
            
            return returnCell
        }
        
    }
    
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
    
}