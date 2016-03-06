//
//  TableViewCell.swift
//  Swiftgram
//
//  Created by Maliha Fairooz on 3/5/16.
//  Copyright © 2016 Maliha Fairooz. All rights reserved.
//

import UIKit
import AFNetworking


class TableViewCell: UITableViewCell {

    @IBOutlet weak var swiftcell: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
