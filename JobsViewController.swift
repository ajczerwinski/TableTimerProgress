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
    
    var icRoles = ["placeholder", "student", "intern", "junior developer", "developer", "senior developer", "lead developer", "staff engineer", "senior staff engineer", "distinguished engineer", "super distinguished engineer"]
    
    var icDescriptions = ["placeholder description", "just tryin' to learn", "get a taste of work life", "bottom of the totem pole", "finally credible", "really hitting your stride", "you're in charge now", "build critical components", "build critical major tech", "industry expert", "time for that acm award"]
    
    var icImages = [#imageLiteral(resourceName: "placeholder"), #imageLiteral(resourceName: "studentDev"), #imageLiteral(resourceName: "internDev"), #imageLiteral(resourceName: "juniorDev"), #imageLiteral(resourceName: "dev"), #imageLiteral(resourceName: "seniorDev"), #imageLiteral(resourceName: "leadDev"), #imageLiteral(resourceName: "staffEng"), #imageLiteral(resourceName: "seniorStaffEng"), #imageLiteral(resourceName: "distinguishedEng"), #imageLiteral(resourceName: "superDistinguishedEng")]
    
    var roleFetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var scoreFetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var assistantFetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    var scoreClass = Score.init(entity: NSEntityDescription.entity(forEntityName: "Score", in: context)!, insertInto: context)
    var assistantClass = Assistant.init(entity: NSEntityDescription.entity(forEntityName: "Assistant", in: context)!, insertInto: context)
    var roleClass = Role.init(entity: NSEntityDescription.entity(forEntityName: "Role", in: context)!, insertInto: context)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        attemptFetch()
        
        //setBackground()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let returnCell = tableView.dequeueReusableCell(withIdentifier: "RoleCell", for: indexPath) as! RoleCell
        
        if indexPath.row == 0 {
            
            returnCell.mainImg.isHidden = true
            returnCell.roleTitleLbl.isHidden = true
            returnCell.roleDescLbl.isHidden = true
            returnCell.tapProgressBar.isHidden = true
            returnCell.timerProgressBar.isHidden = true
            returnCell.tapRoleBtnLbl.isHidden = true
            returnCell.purchaseRoleBtnLbl.isHidden = true
            returnCell.numRolesLbl.isHidden = true
            returnCell.priceToPurchaseLbl.isHidden = true
            
            returnCell.roleCellView.backgroundColor = UIColor.white
            
        } else {
            
            returnCell.scoreLbl.isHidden = true
            returnCell.assistantsLbl.isHidden = true
            returnCell.assistantsAvailableLbl.isHidden = true
            returnCell.resetButtonLbl.isHidden = true
            
            returnCell.configureRoleCell(image: icImages[indexPath.row], role: icRoles[indexPath.row], desc: icDescriptions[indexPath.row])
            
        }
        
        return returnCell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icRoles.count
    }
    
    func attemptFetch() {
        setFetchedResults()
        
        do {
            try self.roleFetchedResultsController.performFetch()
        } catch {
            let error = error as NSError
            print("\(error), \(error.userInfo)")
        }
        
        do {
            try self.scoreFetchedResultsController.performFetch()
        } catch {
            let error = error as NSError
            print("\(error), \(error.userInfo)")
        }
        
        do {
            try self.assistantFetchedResultsController.performFetch()
        } catch {
            let error = error as NSError
            print("\(error), \(error.userInfo)")
        }
        
    }
    
    func setFetchedResults() {
        
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        let roleFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Role")
        let scoreFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Score")
        let assistantFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Assistant")
        
        let roleSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        let scoreSortDescriptor = NSSortDescriptor(key: "runningScore", ascending: true)
        
        let assistantSortDescriptor = NSSortDescriptor(key: "numAvailable", ascending: true)
        
        roleFetchRequest.sortDescriptors = [roleSortDescriptor]
        
        scoreFetchRequest.sortDescriptors = [scoreSortDescriptor]
        
        assistantFetchRequest.sortDescriptors = [assistantSortDescriptor]
        
        let roleController = NSFetchedResultsController(fetchRequest: roleFetchRequest, managedObjectContext: ad.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        let scoreController = NSFetchedResultsController(fetchRequest: scoreFetchRequest, managedObjectContext: ad.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        let assistantController = NSFetchedResultsController(fetchRequest: assistantFetchRequest, managedObjectContext: ad.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        roleController.delegate = self
        scoreController.delegate = self
        assistantController.delegate = self
        
        roleFetchedResultsController = roleController
        scoreFetchedResultsController = scoreController
        assistantFetchedResultsController = assistantController
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
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
                let cell = tableView.cellForRow(at: indexPath) as! RoleCell
                //configureTitleCell(cell: cell, indexPath: indexPath as NSIndexPath)*/
            
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
        default:
            break
        }
        
    }
    
}
