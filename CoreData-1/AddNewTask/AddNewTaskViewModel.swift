//
//  AddNewTaskViewModel.swift
//  CoreData-1
//
//  Created by Field Employee on 2/24/21.
//

import Foundation

class AddNewTaskViewModel {
    var name: String
    var date: Date
    
    init(name: String, date: Date) {
        self.name = name
        self.date = date
    }
    
    func saveTask(completion: @escaping (Bool) -> Void) {
        CoreDataManager.shared.saveTodo(name: self.name, dueOn: self.date, completion: completion)
    }
}
