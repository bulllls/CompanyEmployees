//
//  TableViewCell.swift
//  Filistovich_Ruslan_CoreData_wh
//
//  Created by Ruslan on 11/8/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class PersonCompanyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personAgeLabel: UILabel!
    @IBOutlet weak var agePersonStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func agePersonStepper(_ sender: Any) {
        print("Tab stepper")
    }
}
