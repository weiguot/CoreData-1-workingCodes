//
//  ToDoViewCellTableViewCell.swift
//  CoreData-1
//
//  Created by Field Employee on 2/23/21.
//

import UIKit

class ToDoViewCell: UITableViewCell {
    
    @IBOutlet private weak var taskNameLabel: UILabel!
    @IBOutlet private weak var taskDueDate: UILabel!
    @IBOutlet private weak var taskCompletedDate: UILabel!
    
    //    var todo: ToDo? {
    //        didSet {
    //            if let todo = todo {
    //               if todo.completed == false{
    //                    taskNameLabel.text = todo.name
    //                }
    //            }
    //        }
    //    }
    
    var todo: ToDo? {
        didSet {
            if let todo = todo {
                if todo.completed == false {
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due on %@",
                                              todo.dueDate!.toString(format: "MM YY DD"))
                    taskCompletedDate.text = "To be completed"
                } else {
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due on %@",
                                              todo.dueDate!.toString(format: "MM YY DD"))
                    taskCompletedDate.text = String(format: "Completed on %@", todo.dueDate!.toString(format: "MM YY DD"))
                    
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
