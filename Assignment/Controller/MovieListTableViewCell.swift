//
//  MovieListTableViewCell.swift
//  Assignment
//
//  Created by Wenpeng Jiang on 10/9/18.
//  Copyright © 2018 Wenpeng Jiang. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieDes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
