//
//  ToDo+CoreDataProperties.swift
//  CoreData-1
//
//  Created by Field Employee on 2/23/21.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var dueDate: Date?
    @NSManaged public var completedDate: Date?
    @NSManaged public var completed: Bool

}

extension ToDo : Identifiable {

}
