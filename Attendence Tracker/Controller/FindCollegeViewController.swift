//
//  ViewController.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 01/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import UIKit
import RealmSwift
class FindCollegeViewController: UIViewController, UISearchBarDelegate {
    var CollegeArray: Results<College>?
    let realm = try! Realm()
    
    
    @IBOutlet weak var addCollegeNotPresent: UIButton!
    @IBOutlet weak var searchCollege: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addButtonCollege(_ sender: Any) {
        self.performSegue(withIdentifier: "goToAddCollege", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddCollege" {
            
            _ = segue.destination as! EnterCollegeDetailsViewController
            
        }
    }
    
}


