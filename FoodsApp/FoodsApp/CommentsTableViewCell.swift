//
//  CommentsTableViewCell.swift
//  FoodsApp
//
//  Created by Erik Baliov on 26.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var commentNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentDateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
