//
//  TimeTableViewController.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 06/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import UIKit

class TimeTableViewController: UITableViewController {
    var arr:[String]=[]
    var docId = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeTable", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        print("1")
        return cell
        
    }
    
    @IBAction func dayPress(_ sender: UIButton){
        tableView(UITableView, cellForRowAt: IndexPath)
        
    }
}
