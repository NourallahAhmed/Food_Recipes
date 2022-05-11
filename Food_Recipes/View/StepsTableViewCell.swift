//
//  StepsTableViewCell.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import UIKit

class StepsTableViewCell: UITableViewCell {
    @IBOutlet weak var stepsDetails: UILabel!
    
    @IBOutlet weak var myView: CardView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var Step: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
