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
       
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var foodTitleLabel: UILabel!
       @IBOutlet weak var foodDishTypeLabel: UILabel!
       @IBOutlet weak var foodHealthScoreLabel: UILabel!
       @IBOutlet weak var foodDurrationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backView.layer.borderColor = UIColor.systemBlue.cgColor
        backView.backgroundColor = UIColor(named: "#f8f8ff")
        backView.layer.cornerRadius = backView.frame.height/6

        self.backView.layer.borderWidth = 1
        
        //MARK: - image
        
//        foodImageView.layer.borderWidth = 1
//        foodImageView.layer.masksToBounds = false
////        foodImageView.layer.borderColor = UIColor.systemBlue.cgColor
//        foodImageView.layer.cornerRadius = foodImageView.frame.height/10
//        
//        foodImageView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
