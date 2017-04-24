//
//  JobsViewController.swift
//  TableTimerProgress
//
//  Created by Allen Czerwinski on 4/22/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit
import CoreData

class JobsViewController: CoreDataTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Jobs"
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        fr.sortDescriptors = [NSSortDescriptor(key: "role", ascending: true), NSSortDescriptor(key: "creationDate", ascending: false)]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
        
    }
    
    
}
