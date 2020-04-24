//
//  CellTableViewCell.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/19.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit
import Dev_Pod

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var backgroundCardView: UIView!

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
