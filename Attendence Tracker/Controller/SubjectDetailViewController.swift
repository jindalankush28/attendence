//
//  SubjectDetailViewController.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 02/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit
class SubjectDetailViewController: SwipeTableViewController{
    
   
    
    
    var subjArray: Results<Subject>?
    let realm = try! Realm()
    var selectedCollege: College?{
        didSet{
            loadSubject()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjArray?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let i = subjArray?[indexPath.row]{
            cell.textLabel?.text = i.subjectName
        }
        return cell
    
    }
    func updateSubjects(at indexPath: IndexPath){
        if let catdel = self.subjArray?[indexPath.row]{
        do{
            try self.realm.write{
                self.realm.delete(catdel)
            }
        }catch{
            print(error)
        }
}
}
    @IBAction func add(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "add Subject", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add Subject", style: .default) { (action) in
            if let currCollege = self.selectedCollege{
                do{
                    try self.realm.write{
                        let newsubj = Subject()
                        newsubj.subjectName = textfield.text!
                        currCollege.subjects.append(newsubj)
                    }
                }catch{
                    print(error)
                }
            }
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alerttf) in
            alerttf.placeholder = "create new subject"
            textfield = alerttf
            
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)

    }
    func loadSubject(){
        subjArray = selectedCollege?.subjects.sorted(byKeyPath: "subjectName", ascending: true)
        tableView.reloadData()
    }
}
