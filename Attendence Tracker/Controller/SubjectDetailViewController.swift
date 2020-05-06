//
//  SubjectDetailViewController.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 02/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import UIKit
import Firebase
class SubjectDetailViewController: UITableViewController {
    var docId = ""
    let db = Firestore.firestore()
    var arr : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subDetails", for: indexPath)
        
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    @IBAction func addSubjectPress(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "add item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "addd item", style: .default) { (action) in
            let newsubj = textfield.text!
            self.arr.append(newsubj)
            /*let newitem = Item(context: context)
             newitem.title = textfield.text!
             newitem.done = false
             newitem.parentCategory = self.selectedCategory
             
             self.saveItems()*/
            //                if let currCategory = self.selectedCategory{
            //                    do{
            //                        try self.realm.write{
            //                            let newitem = Item()
            //                            newitem.title = textfield.text!
            //                            currCategory.items.append(newitem)
            //                        }
            //                    }catch{
            //                        print(error)
            //                    }
            //                }
            
        self.tableView.reloadData()
        
    }
    alert.addTextField { (alerttf) in
    alerttf.placeholder = "create new item"
    textfield = alerttf
    
    }
    alert.addAction(action)
    present(alert,animated: true,completion: nil)
}


    @IBAction func saveNextPress(_ sender: UIButton) {
        db.collection("collegeDetails").document(docId).setData(["subjectArray":arr],merge: true)
        performSegue(withIdentifier: "timeTable", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "timeTable"{
        let destVC = segue.destination as! TimeTableViewController
        
        destVC.docId = self.docId
        destVC.arr = self.arr
    }
    }
}
