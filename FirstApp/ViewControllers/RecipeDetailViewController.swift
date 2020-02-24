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
    @IBOutlet weak var ingredientsLabel: UILabel!
    var image = ""
    var recipeTitle = ""
    var recipeIngredients = ""
    var website = ""
    let barButtonAppearance = UIBarButtonItem.appearance()

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = recipeTitle
        ingredientsLabel.text = recipeIngredients

        if image == "noImage" {
            recipeImageView.image = UIImage(named: "noImage")
        } else {
            let foodImage = image
            guard let url = URL(string: foodImage) else {fatalError()}
            recipeImageView.downloadImage(from: url)
        }
    }

    @IBAction func linkButtonTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: website)!, options: [:], completionHandler: nil)
    }
}
