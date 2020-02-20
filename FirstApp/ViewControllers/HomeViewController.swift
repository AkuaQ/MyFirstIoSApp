import UIKit

class HomeViewController: UIViewController {
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
        recipeSearchBar.delegate = self
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
        view.window?.rootViewController = detailViewController
        view.window?.makeKeyAndVisible()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as? CellTableViewCell else {
                fatalError() }
        let foods = foodList[indexPath.row]
        cell.titleLabel.text = foods.title
        if !(foods.thumbnail == "") {
            guard let url = URL(string: foods.thumbnail) else {fatalError()}
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
        let foodRequest = FoodRequest(countryCode: searchBarText)
        foodRequest.getSearchResult { [weak self] result in
            for identifier in result {
                self?.foodList.append(identifier)
            }
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
