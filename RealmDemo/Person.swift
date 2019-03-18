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
    @objc dynamic var id: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }

    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
