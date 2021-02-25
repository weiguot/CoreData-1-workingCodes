//
//  CoreDataManager.swift
//  CoreData-1
//
//  Created by Field Employee on 2/24/21.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    func deleteTask(todo t: ToDo, completion: @escaping (Bool) -> Void){
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            if result.count > 0 {
                let todo = result.first!
                persistentContainer.viewContext.delete(todo)
                completion(true)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func completeTask(todo t: ToDo, completion: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            if result.count > 0 {
                let todo = result.first!
                todo.completed = true
                todo.completedDate = Date()
                saveContext()
                completion(true)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func getAlltodos() -> [ToDo] {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        var todos = [ToDo]()
        do {
            todos = try persistentContainer.viewContext.fetch(request)
        } catch let err {
            print(err.localizedDescription)
        }
        return todos
    }
    
    func saveTodo (name: String, dueOn: Date, completion: @escaping(Bool) -> Void) {
        let todo = ToDo(context: persistentContainer.viewContext)
        todo.name = name
        todo.dueDate = dueOn
        todo.id = UUID()
        saveContext()
        completion(true)
    }
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CoreData_1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
