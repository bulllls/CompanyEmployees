//
//  Person+CoreDataProperties.swift
//  Filistovich_Ruslan_CoreData_wh
//
//  Created by Ruslan on 11/4/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var company: Company?

}
