//
//  RecipeCellTableViewCell.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/22.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit

class RecipeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
