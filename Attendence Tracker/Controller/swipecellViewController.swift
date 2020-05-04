//
//  swipecellViewController.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 03/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import UIKit
import SwipeCellKit
class SwipeTableViewController: UITableViewController,SwipeTableViewCellDelegate {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subDetails", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.updateSubject(at: indexPath)
        }
        // customize the action appearance
        deleteAction.image = UIImage(named: "Trash Icon")
        
        return [deleteAction]
    }
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        
        return options
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0

       
    }
    func updateSubject(at indexPath: IndexPath){
            
    }

    
}
