//
//  ViewController.swift
//  CoreData-1
//
//  Created by Field Employee on 2/23/21.
//

import UIKit

class ToDoListController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        tableview.estimatedRowHeight = 44
    }


}

extension ToDoListController UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: indexPath) -> UITableViewCell {
        
    }
}
