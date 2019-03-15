//
//  Student.swift
//  RealmDemo
//
//  Created by can.khac.nguyen on 3/15/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import Realm

class Student: NSObject {
    @objc dynamic var name: String?
    @objc dynamic var age: Int = 0
}
