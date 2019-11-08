//
//  Company+CoreDataProperties.swift
//  Filistovich_Ruslan_CoreData_wh
//
//  Created by Ruslan on 11/4/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }
    
    
    @nonobjc public class func nameCompanyfetchRequest() -> NSFetchRequest<Company> {
        let request = NSFetchRequest<Company>(entityName: "Company")
        let descriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [descriptor]
        return request
    }
    
    @NSManaged public var name: String?
    @NSManaged public var person: NSSet?

}

// MARK: Generated accessors for person
extension Company {

    @objc(addPersonObject:)
    @NSManaged public func addToPerson(_ value: Person)

    @objc(removePersonObject:)
    @NSManaged public func removeFromPerson(_ value: Person)

    @objc(addPerson:)
    @NSManaged public func addToPerson(_ values: NSSet)

    @objc(removePerson:)
    @NSManaged public func removeFromPerson(_ values: NSSet)

}
