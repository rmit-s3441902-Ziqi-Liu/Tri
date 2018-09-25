//
//  MyBookingTableViewCell.swift
//  Assignment
//
//  Created by XIAOHAN ZENG on 2018/9/16.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class MyBookingTableViewCell: UITableViewCell {
    @IBOutlet weak var movie: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
