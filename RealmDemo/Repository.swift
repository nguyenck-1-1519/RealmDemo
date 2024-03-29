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
        return realm?.objects(Student.self).sorted(byKeyPath: "id", ascending: true)
    }

    func getAllStudentWithoutBags() -> Results<Student>? {
        return realm?.objects(Student.self)
            .filter(NSPredicate(format: "bags.@count <= 0"))
            .sorted(byKeyPath: "id", ascending: true)
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

    func  delete(bagIndex: Int, owner: Student) {
        try? realm?.write {
            owner.bags.remove(at: bagIndex)
            realm?.add(owner, update: true)
        }
    }

    func delete(student: Student) {
        try? realm?.write {
            realm?.delete(student)
        }
    }
}
