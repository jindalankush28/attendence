//
//  Subject.swift
//  Attendence Tracker
//
//  Created by Ankush Jindal on 01/05/20.
//  Copyright © 2020 Ankush Jindal. All rights reserved.
//

import Foundation
import RealmSwift

class Subject:Object{
    @objc dynamic var subjectName:String = ""
    var parentCategory = LinkingObjects(fromType: College.self, property: "subjects")
}
