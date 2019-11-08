//
//  EditPersonViewController.swift
//  Filistovich_Ruslan_CoreData_wh
//
//  Created by Ruslan on 11/8/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class EditPersonViewController: UIViewController {
    @IBOutlet weak var namePersonLabel: UIStackView!
    
    @IBOutlet weak var agePersonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Person"
       
    }
    

    @IBAction func deletePerson(_ sender: Any) {
    }

}
