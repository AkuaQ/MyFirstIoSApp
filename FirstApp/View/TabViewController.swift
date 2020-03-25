//
//  TabViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/25.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    @IBOutlet weak var tabbar: UITabBar!
    var username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let home = self.viewControllers?[0] as? HomeViewController
        let favourite = self.viewControllers?[1] as? FavouritesObjectiveCViewController
        let recipeList = self.viewControllers?[2] as? RecipeListViewController
        home?.username = username
        favourite?.username = username
        recipeList?.username = username
        print("Tabs: \(username)")
    }
}
