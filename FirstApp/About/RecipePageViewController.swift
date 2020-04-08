//
//  RecipePageViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/04/07.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit

class RecipePageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let aboutRequest = AboutRequest()
        aboutRequest.getAboutResult { result in
            self.titleLabel.text = result[0].description
        }
    }
}
