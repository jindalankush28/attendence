//
//  CollegeList.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 01/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import Foundation
import RealmSwift
class College: Object{
    @objc dynamic var collegeName:String=""
    @objc dynamic var collegeYear:Double=0.0
    @objc dynamic var collegeSem:Int=0
    @objc dynamic var collegeBatch:String=""
    @objc dynamic var collegeCourse:String=""
    
    let subjects = List<Subject>()
    
    
}
