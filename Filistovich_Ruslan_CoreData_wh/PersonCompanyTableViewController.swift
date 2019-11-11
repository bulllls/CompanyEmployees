//
//  PersonCompanyTableViewController.swift
//  Filistovich_Ruslan_CoreData_wh
//
//  Created by Ruslan on 11/8/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class PersonCompanyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Persons"
    }
    
    let manager = DataManager()
    var persons = [Person]()
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCompanyTableViewCell", for: indexPath) as? PersonCompanyTableViewCell
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tab cell")
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "EditPersonViewController") as? EditPersonViewController else {  return }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func addPerson(_ sender: Any) {
        print("add")
    }
 
}
