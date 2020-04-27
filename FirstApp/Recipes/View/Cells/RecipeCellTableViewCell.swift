//
//  RecipeCellTableViewCell.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/22.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit
import  Dev_Pod

class RecipeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var recipeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Utilities.styleBackgroundCardView(backgroundCardView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        titleLabel.textColor = selected ? .white : UIColor(named: "PurplePink")
        backgroundCardView.backgroundColor = selected ? UIColor(named: "PurplePink") : .white
    }
}
