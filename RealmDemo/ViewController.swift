//
//  ViewController.swift
//  RealmDemo
//
//  Created by can.khac.nguyen on 3/14/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var idTextfield: UITextField!
    
    var count = 0
    var listStudent: Results<Student>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listStudent = Repository.shared.getAllStudent()
    }
    
    @IBAction func onAddButtonClicked(_ sender: Any) {
        guard let firstName = firstNameTextfield.text, !firstName.isEmpty,
            let lastName = lastNameTextfield.text, !lastName.isEmpty,
            let id = idTextfield.text, !id.isEmpty else {
            return
        }
        let person = Person(age: 18)
        let student = Student(person: person, firstName: firstName, lastName: lastName, id: id)
        Repository.shared.add(student: student)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStudent?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let student = listStudent?[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell") as? TextTableViewCell else {
            return UITableViewCell()
        }
        cell.contentLabel.text = "\(String(describing: student.id)) -- \(String(describing: student.firstName)) \(String(describing: student.lastName))"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let listStudent = listStudent,
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BagsViewController") as? BagsViewController else {
            return
        }
        vc.owner = listStudent[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
  
