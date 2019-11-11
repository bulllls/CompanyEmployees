//
//  DataManager.swift
//  Filistovich_Ruslan_CoreData_wh
//
//  Created by Ruslan on 11/10/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    lazy var frc: NSFetchedResultsController<Company> = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        let context = appDelegate.persistentContainer.viewContext
        let request = Company.nameCompanyfetchRequest()
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }()
}

let manager = DataManager()
