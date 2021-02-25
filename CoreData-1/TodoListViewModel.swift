//
//  TodoListViewModel.swift
//  CoreData-1
//
//  Created by Field Employee on 2/24/21.
//

import Foundation

class TodoListViewModel {
    var todos = [ToDo]()
    
    var count:Int {
        return todos.count
    }
    
    init() {
        self.refreshData()
    }
    
    func todoAtIndex(_ index: Int) -> ToDo {
        return todos[index]
    }
    
    func refreshData() {
        self.todos = CoreDataManager.shared.getAlltodos()
    }
}
