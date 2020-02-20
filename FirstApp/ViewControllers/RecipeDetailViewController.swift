//
//  RecipeDetailViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/19.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    var image = UIImage()
    var recipeTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = recipeTitle
        recipeImageView.image = image
    }
}
