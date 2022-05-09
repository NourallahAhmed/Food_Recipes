//
//  TableViewCell.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/8/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
       
       @IBOutlet weak var foodTitleLabel: UILabel!
       @IBOutlet weak var foodDishTypeLabel: UILabel!
       @IBOutlet weak var foodHealthScoreLabel: UILabel!
       @IBOutlet weak var foodDurrationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
