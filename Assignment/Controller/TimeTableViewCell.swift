//
//  TimeTableViewCell.swift
//  Assignment
//
//  Created by 刘子奇 on 2018/9/14.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
