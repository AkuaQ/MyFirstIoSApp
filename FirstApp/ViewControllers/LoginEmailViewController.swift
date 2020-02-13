import UIKit
import FirebaseAuth

class LoginEmailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginTapped(_ sender: Any) {
        //Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (_ result, error) in
            //Check for errors
            if error != nil {
                //Cannot sign in
            }
            else {
                self.transitionToHome()
            }
        }
    }
    func transitionToHome() {
        let homeViewController = storyboard?
            .instantiateViewController(identifier: Constants.Storyboard
            .homeViewController)
            as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
