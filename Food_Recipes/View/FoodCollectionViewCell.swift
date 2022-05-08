//
//  FoodCollectionViewCell.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodDishTypeLabel: UILabel!
    @IBOutlet weak var foodHealthScoreLabel: UILabel!
    @IBOutlet weak var foodSummaryLabel: UILabel!
}
