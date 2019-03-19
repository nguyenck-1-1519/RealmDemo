//
//  Repository.swift
//  RealmDemo
//
//  Created by Can Khac Nguyen on 3/18/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import RealmSwift

class Repository {
    static let shared = Repository()

    let realm = try? Realm()
    
    func getAllStudent() -> Results<Student>? {
        return realm?.objects(Student.self)
    }
    
    func add(student: Student) {
        do {
            try realm?.write {
                realm?.add(student, update: true)
            }
        } catch let error {
            print(error)
        }
    }

    func add(bag: Bag, forOwner owner: Student) {
        do {
            try realm?.write {
                owner.bags.append(bag)
                realm?.add(owner, update: true)
            }
        } catch let error {
            print(error)
        }
    }
}
