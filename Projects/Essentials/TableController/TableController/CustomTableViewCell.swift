//
//  CustomTableViewCell.swift
//  TableController
//
//  Created by Prashanna Raghavan on 7/27/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(artist:String,song:String)
    {
        self.textLabel?.text = artist
        self.textLabel?.textColor = UIColor.white
        self.detailTextLabel?.text = song
        self.detailTextLabel?.textColor = UIColor.white
        self.backgroundColor = UIColor.black
    }
}
