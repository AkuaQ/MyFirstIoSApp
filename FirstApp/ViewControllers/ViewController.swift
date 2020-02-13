import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUpElements()
    }
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        sender.flash()
        print("Email sign in chosen")
    }
    func setUpElements() {
        //Style the elements
        /*Utilities.styleFilledButton(thirdButton)
         Utilities.styleHollowButton(signUpButton)*/
    }
}
