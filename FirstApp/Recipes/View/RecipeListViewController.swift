//
//  RecipeListViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/22.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit
import Dev_Pod

class RecipeListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    var username = ""
    var foodList = [FoodDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeSearchBar.delegate = self
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.topItem?.title = "Recipe List"
        AnalyticsRecipeRepo.recipeListPageTabTapped()
    }
}

extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(identifier:
            Constants.Storyboard.recipeDetailViewController)
            as? RecipeDetailViewController
        let foods = foodList[indexPath.row]
        detailViewController?.recipeTitle = foods.title
        detailViewController?.recipeIngredients = foods.ingredients
        detailViewController?.navbar = "Recipe Details"
        detailViewController?.sideNavBar = "Recipe List"
        detailViewController?.website = foods.href
        if !(foods.thumbnail == "") {
            detailViewController?.image = foods.thumbnail
        } else {
            detailViewController?.image = "noImage"
        }
        detailViewController?.username = username
        self.navigationController?.pushViewController(detailViewController!, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
            as? RecipeCellTableViewCell else {
                fatalError() }
        cell.titleLabel.text = foodList[indexPath.row].title
        cell.ingredientsLabel.text = foodList[indexPath.row].ingredients
        if !(foodList[indexPath.row].thumbnail == "") {
            guard let url = URL(string: foodList[indexPath.row].thumbnail) else {fatalError()}
            cell.recipeImageView.downloadImage(from: url)
        } else {
            cell.recipeImageView.image = UIImage(named: "noImage")
        }
        return cell
    }
}

extension RecipeListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = recipeSearchBar.text else {return}
        let foodRequest = FoodRequest(foodQuery: searchBarText, typeQuery: "q")
        foodRequest.getSearchResult { [weak self] result in
            self?.foodList = result
        }
        AnalyticsRecipeRepo.recipeListPageSearched()
    }
}
