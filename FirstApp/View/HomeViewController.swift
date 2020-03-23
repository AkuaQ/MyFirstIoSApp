import UIKit
import Dev_Pod
import  DropDown

class HomeViewController: UIViewController {
    var data: [String] = ["Sugar", "Salt", "Cocoa Butter", "Milk",
                          "Vanilla Essence", "Egg", "Fish", "Raisins",
                          "Tomato", "Water", "Baking Soda", "Oil", "Flour"]
    var dataFiltered: [String] = []
    var dropButton = DropDown()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    var foodList = [FoodDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataFiltered = data

        dropButton.anchorView = recipeSearchBar
        dropButton.bottomOffset = CGPoint(x: 0, y: (dropButton.anchorView?.plainView.bounds.height)!)
        dropButton.backgroundColor = .white
        dropButton.direction = .bottom

        dropButton.selectionAction = { [unowned self] (index: Int, item: String) in
            self.recipeSearchBar.text = item
        }
        recipeSearchBar.delegate = self
        self.hideKeyboardWhenTappedAround()
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataFiltered = searchText.isEmpty ? data : data.filter({ (dat) -> Bool in
            dat.range(of: searchText, options: .caseInsensitive) != nil
        })

        dropButton.dataSource = dataFiltered
        dropButton.show()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        for object: UIView in ((searchBar.subviews[0] )).subviews {
            if let zKey = object as? UIButton {
                let btn: UIButton = zKey
                btn.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        dataFiltered = data
        dropButton.hide()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
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
        detailViewController?.navbar = "Home"
        detailViewController?.website = foods.href
        if !(foods.thumbnail == "") {
            detailViewController?.image = foods.thumbnail
        } else {
            detailViewController?.image = "noImage"
        }
        self.navigationController?.pushViewController(detailViewController!, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as? CellTableViewCell else {
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

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = recipeSearchBar.text else {return}
        let foodRequest = FoodRequest(foodQuery: searchBarText, typeQuery: "i")
        foodRequest.getSearchResult { [weak self] result in
            self?.foodList = result
        }
    }
}

extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        getData(from: url) {data, _, error in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
