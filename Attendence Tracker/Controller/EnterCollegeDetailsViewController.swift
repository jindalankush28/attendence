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

import FirebaseFirestore
class EnterCollegeDetailsViewController: UIViewController{
    let db = Firestore.firestore()
    
    //var ref: DatabaseReference!
    let realm = try! Realm()
    var newCollege = College()
    var collegeArray: Results<College>?
    let courseSelectionList = ["mbbs","eng"]
    let batchSelectionList = ["A","B","C","D"]
    var docId = ""
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
        //ref = Database.database().reference()
        enterCollegeName.delegate = self
        
        //db.collection("collegeDetails").addDocument(data: ["name":"gmch","year":1,"sem":1,"course":"mbbs","batch":"A"])
    }
    
    @IBAction func yearStepperIncrease(_ sender: UIStepper) {
        yearLabel.text = String(Int((sender.value)))
        newCollege.collegeYear = Double(sender.value)
       // self.ref.child("colleges").child("clgNYSBC").setValue(["Year":newCollege.collegeYear])
    }
    
    @IBAction func semStepperIncrease(_ sender: UIStepper) {
        semLabel.text = String(Int((sender.value)))
        newCollege.collegeSem = Int(sender.value)
        //self.ref.child("colleges").child("clgNYSBC").setValue(["Sem":newCollege.collegeSem])
    }
   
    @IBAction func saveNextPress(_ sender: UIButton) {
        newCollege.collegeName = enterCollegeName.text ?? ""
        docId = "\(newCollege.collegeName),year=\(newCollege.collegeYear),sem=\(newCollege.collegeSem),course=\(newCollege.collegeCourse),batch=\(newCollege.collegeBatch)"
        let newDoc = db.collection("collegeDetails").document(docId)
        newDoc.setData(["name":newCollege.collegeName,"year":newCollege.collegeYear,"sem":newCollege.collegeSem,"course":newCollege.collegeCourse,"batch":newCollege.collegeBatch])
        
        performSegue(withIdentifier: "goToSubjectDetails", sender: self)
    }
    
    func saveNewCollege(_ college: College){
        
        //self.ref.child("colleges").child("clgNYSBC").setValue(["Name":newCollege.collegeName])
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
            //self.ref.child("colleges").child("clgNYSBC").setValue(["Course":newCollege.collegeCourse])
            courseLabel.text = courseSelectionList[row]
        }else{
            newCollege.collegeBatch = batchSelectionList[row]
            //self.ref.child("colleges").child("clgNYSBC").setValue(["Batch":newCollege.collegeBatch])
            batchLabel.text = batchSelectionList[row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSubjectDetails"{
            let destVC = segue.destination as! SubjectDetailViewController
            
            destVC.docId = self.docId
        }
    }
    
}
extension EnterCollegeDetailsViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
    
    
    
    

