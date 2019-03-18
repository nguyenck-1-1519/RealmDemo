//
//  Person.swift
//  RealmDemo
//
//  Created by can.khac.nguyen on 3/18/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    let age = RealmOptional<Int>()
    
    convenience init(age: Int) {
        self.init()
        self.age.value = age
    }
}
