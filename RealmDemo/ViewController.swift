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
    @IBOutlet weak var filteringButton: UIButton!

    var count = 0
    var isFiltering = false
    var listStudent: Results<Student>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listStudent = Repository.shared.getAllStudent()
    }
    
    @IBAction func onFilteringButtonClicked(_ sender: Any) {
        if isFiltering {
            filteringButton.backgroundColor = .lightGray
            filteringButton.setTitle("Filtering Students Without Bag", for: .normal)
            listStudent = Repository.shared.getAllStudent()
        } else {
            filteringButton.backgroundColor = .blue
            filteringButton.setTitle("Filter Students Without Bag", for: .normal)
            listStudent = Repository.shared.getAllStudentWithoutBags()
        }
        isFiltering = !isFiltering
        tableView.reloadData()
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
        cell.contentLabel.text = "\(String(describing: student.id)) -- \(student.name)"
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

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let listStudent = listStudent else { return }
            Repository.shared.delete(student: listStudent[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
  
