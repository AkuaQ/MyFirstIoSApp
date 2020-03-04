import UIKit
import Dev_Pod

class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }

    func setUpElements() {
        //Style the elements
        Utilities.styleFilledButton(loginButton)
        Utilities.styleHollowButton(signUpButton)
    }
}
