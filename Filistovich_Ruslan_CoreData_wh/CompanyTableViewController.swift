//
//  ViewController.swift
//  Filistovich_Ruslan_CoreData_wh
//
//  Created by Ruslan on 11/3/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit
import CoreData

class CompanyTableViewController: UIViewController {
    
    @IBOutlet weak var companyTable: UITableView!
    var company = [Company]()
    
    lazy var frc: NSFetchedResultsController<Company> = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        let context = appDelegate.persistentContainer.viewContext
        let request = Company.nameCompanyfetchRequest()
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }()
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      try? frc.performFetch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        companyTable.dataSource = self
        companyTable.delegate = self
        frc.delegate = self
        title = "Company"
    }
    
    
    func saveCompany(companyName: String) {
        let newCompany = Company(context: frc.managedObjectContext)
        newCompany.name = companyName
        try? frc.managedObjectContext.save()
    }
    
    @IBAction func addCompanyInTable(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Company", message: "Add new company", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard
                let textField = alert.textFields?.first,
                let nameToSave = textField.text
                else { return }
            self.saveCompany(companyName: nameToSave)
            self.companyTable.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}

extension CompanyTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return frc.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return frc.sections?[section].numberOfObjects ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = frc.object(at: indexPath).name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       return true
     }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       let object = frc.object(at: indexPath)
       frc.managedObjectContext.delete(object)
       try? frc.managedObjectContext.save()
     }
    
}

extension CompanyTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        companyTable.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "PersonCompanyTableViewController") as? PersonCompanyTableViewController else {  return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CompanyTableViewController: NSFetchedResultsControllerDelegate {
    
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    companyTable.beginUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type {
    case .insert:
      companyTable.insertRows(at: [indexPath ?? newIndexPath ?? IndexPath(row: 0, section: 0)], with: .automatic)
    case .delete:
      companyTable.deleteRows(at: [indexPath!], with: .fade)
    case .move:
      companyTable.moveRow(at: indexPath!, to: newIndexPath!)
    case .update:
      companyTable.reloadRows(at: [indexPath!], with: .fade)
    default:
        print("Error")
    }
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    companyTable.endUpdates()
  }
  
}
