//
//  ChildObject+CoreDataProperties.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 19.02.2025.
//
//

import Foundation
import CoreData


extension ChildObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChildObject> {
        return NSFetchRequest<ChildObject>(entityName: "ChildObject")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?

}

extension ChildObject : Identifiable {

}
