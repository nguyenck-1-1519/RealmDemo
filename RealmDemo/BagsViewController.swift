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
        var bag = Bag(color: color)
        bag.owner = owner
        
    }
}

extension BagsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell") as? TextTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
