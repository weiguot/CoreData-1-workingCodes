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
    
    var todo: ToDo? {
        didSet {
            if let todo = todo {
                todo.completed == false {
                    taskNameLabel.text = todo.name
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
