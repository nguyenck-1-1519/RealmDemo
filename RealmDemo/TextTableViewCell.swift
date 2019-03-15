//
//  TextTableViewCell.swift
//  RealmDemo
//
//  Created by can.khac.nguyen on 3/15/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
