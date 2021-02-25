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
                    taskNameLabel.attributedText = todo.name!.strikeThrough()
                    taskDueDate.attributedText = String(format: "Due on %@",
                                                        todo.dueDate!.toString(format: "MM yyyy dd")).strikeThrough()                    //taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due on %@",
                                              todo.dueDate!.toString(format: "MM YY DD"))
                    //taskCompletedDate.text = String(format: "Completed on %@", todo.dueDate!.toString(format: "MM YY DD"))
                    
                }
            }
        }
    }
    
    override func prepareForReuse() {
        taskNameLabel.attributedText = taskNameLabel.text!.removeAttributedText()
        taskDueDate.attributedText =  taskDueDate.text!.removeAttributedText()
        taskNameLabel.text = ""
        taskDueDate.text = ""
        taskCompletedDate.text = ""
        super.prepareForReuse()
        
        
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
