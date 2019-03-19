//
//  BagsViewController.swift
//  RealmDemo
//
//  Created by Can Khac Nguyen on 3/19/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class BagsViewController: UIViewController {
    
    @IBOutlet weak var colorTextfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var owner: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onAddBagsClciked(_ sender: Any) {
        guard let color = colorTextfield.text, !color.isEmpty else {
            return
        }
        let bag = Bag(color: color)
        Repository.shared.add(bag: bag, forOwner: owner)
        colorTextfield.text = ""
        tableView.reloadData()
    }
}

extension BagsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return owner.bags.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BagsTableViewCell") as? TextTableViewCell else {
            return UITableViewCell()
        }
        cell.contentLabel.text = owner.bags[indexPath.row].color
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Repository.shared.delete(bagIndex: indexPath.row, owner: owner)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
