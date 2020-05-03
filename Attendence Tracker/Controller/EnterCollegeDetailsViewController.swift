//
//  EnterCollegeDetails.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 02/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class EnterCollegeDetailsViewController: UIViewController{
    let realm = try! Realm()
    var newCollege = College()
    var collegeArray: Results<College>?
    let courseSelectionList = ["mbbs","eng"]
    let batchSelectionList = ["A","B","C","D"]
  
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var yearStepper: UIStepper!
    @IBOutlet weak var semLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var enterCollegeName: UITextField!
    @IBOutlet weak var semStep: UIStepper!
    @IBOutlet weak var batchLabel: UILabel!
    @IBOutlet weak var coursePicker: UIPickerView!
    @IBOutlet weak var batchPicker: UIPickerView!
    @IBOutlet weak var saveNext: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func yearStepperIncrease(_ sender: UIStepper) {
        yearLabel.text = String(Int((sender.value)))
        newCollege.collegeYear = Double(sender.value)
    }
    
    @IBAction func semStepperIncrease(_ sender: UIStepper) {
        semLabel.text = String(Int((sender.value)))
        newCollege.collegeSem = Int(sender.value)
    }
   
    @IBAction func saveNextPress(_ sender: UIButton) {
        self.saveNewCollege(newCollege)
        performSegue(withIdentifier: "goToSubjectDetails", sender: self)
    }
    
    @IBAction func collegeNameEnter(_ sender: UITextField) {
        
        newCollege.collegeName = enterCollegeName.text ?? ""
        
        
    }
    
    
    
    func saveNewCollege(_ college: College){
        
        try! realm.write(){
            realm.add(college)
        }
    }
}
extension EnterCollegeDetailsViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag==1{
            
            return courseSelectionList[row]
            
        }else{
            
            return batchSelectionList[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag==1{
            
            return courseSelectionList.count
        }else{
            return batchSelectionList.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag==1{
            newCollege.collegeCourse = courseSelectionList[row]
            courseLabel.text = courseSelectionList[row]
        }else{
            newCollege.collegeBatch = batchSelectionList[row]
            batchLabel.text = batchSelectionList[row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSubjectDetails"{
            _ = segue.destination as! SubjectDetailViewController
        }
    }
    
}

    
    
    
    

