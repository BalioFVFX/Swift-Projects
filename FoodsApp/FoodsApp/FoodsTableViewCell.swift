//
//  FoodsTableViewCell.swift
//  FoodsApp
//
//  Created by Erik Baliov on 22.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {

    @IBOutlet weak var foodItemImageView: UIImageView!
    @IBOutlet weak var foodItemRecipeNameLabel: UILabel!
    @IBOutlet weak var foodItemRecipeDurationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
