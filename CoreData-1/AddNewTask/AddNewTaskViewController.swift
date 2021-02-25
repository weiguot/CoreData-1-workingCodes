//
//  AddNewTaskViewController.swift
//  CoreData-1
//
//  Created by Field Employee on 2/24/21.
//

import UIKit

class AddNewTaskViewController: UITableViewController {
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskdueDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskdueDate.minimumDate = Date()
        //tableView.tableFooterView = UIView()
    }
    
    //MARK: - Table view data source
    @IBAction func saveNewTask(_sender: UIBarButtonItem) {
        let vm = AddNewTaskViewModel(name: taskName.text ?? "No name", date: taskdueDate.date)
        vm.saveTask {_ in DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
        
        }
    }
}
