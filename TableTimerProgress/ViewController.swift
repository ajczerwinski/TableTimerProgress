//
//  ViewController.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/19/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    var icRoles = ["student", "intern", "junior developer", "developer", "senior developer", "lead developer", "staff engineer", "senior staff engineer", "distinguished engineer", "super distinguished engineer"]
    
    var icDescriptions = ["just tryin' to learn", "get a taste of work life", "bottom of the totem pole", "finally credible", "really hitting your stride", "you're in charge now", "build critical components", "build critical major tech", "industry expert", "time for that acm award"]

    // TODO - move code to populate image and labels to JobCell VC
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobCell
        let row = indexPath.row
        cell.configureCell(image: #imageLiteral(resourceName: "appImg"), role: icRoles[indexPath.row], desc: icDescriptions[indexPath.row])
        //cell.mainImg.image = #imageLiteral(resourceName: "appImg")
        //cell.roleLbl.text = "hi I'm the app label"
        //cell.descLbl.text = "time will go here"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icRoles.count
    }

}

