//
//  Bag.swift
//  RealmDemo
//
//  Created by can.khac.nguyen on 3/18/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import RealmSwift

class Bag: Object {
    @objc dynamic var color: String?
    let owner = LinkingObjects(fromType: Student.self, property: "bags")
    
    convenience init(color: String) {
        self.init()
        self.color = color
    }
}
