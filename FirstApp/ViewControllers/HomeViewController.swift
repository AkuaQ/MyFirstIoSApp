import UIKit

class HomeViewController: UIViewController {

    var name = ["mon4", "mon5", "mon6", "mon7", "mon8", "mon9", "mon10", "cherry", "apples"]

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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
            as? CellTableViewCell else {
            fatalError() }
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
         let foods = foodList[indexPath.row]
        cell.titleLabel.text = foods.title
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
