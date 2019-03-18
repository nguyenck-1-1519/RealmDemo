//
//  Student.swift
//  RealmDemo
//
//  Created by can.khac.nguyen on 3/15/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import RealmSwift

class Student: Object {
    @objc dynamic var person: Person? = nil
    @objc dynamic var tmpId = 0
    @objc dynamic var name: String { //read only prop >> auto ignored
        return "\(firstName) \(lastName)"
    }
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    let bags = List<Bag>()
    let age = RealmOptional<Int>()

    override static func indexedProperties() -> [String] {
        return ["name"]
    }

    override static func ignoredProperties() -> [String] {
        return ["tmpId"]
    }

    convenience init(person: Person, firstName: String, lastName: String) {
        self.init()
        self.person = person
        self.firstName = firstName
        self.lastName = lastName
    }
}
