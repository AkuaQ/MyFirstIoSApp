import UIKit
import Dev_Pod

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class LoginEmailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        self.hideKeyboardWhenTappedAround()
    }

    func setUpElements() {
        //Hide the error label
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        facebookButton.layer.cornerRadius = facebookButton.frame.width/2
        googleButton.layer.cornerRadius = googleButton.frame.width/2
    }

    //Check the fields and validate that the data is correct.
    //If everything is correct, this method returns nil.
    //Otherwise, it returns the error message
    func validateField() -> String? {
        //Check that all fields are filled in
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if email == "" {
            Utilities.styleErrorTextField(emailTextField)
            return "Please fill in all fields"
        }
        if password == "" {
            Utilities.styleErrorTextField(passwordTextField)
            return "Please fill in all fields"
        }        //Check if password secure
        return nil
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        setUpElements()
        AnalyticsLoginRepo.loginPageLoginTapped()
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { _ in
                            UIButton.animate(withDuration: 0.2, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        let error = validateField()
        if error != nil {
            //There's something wrong with the fields, show the error message
            showError(error!)
        } else {
            //Create cleaned versions of the text field
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //Signing in the user
            let userModel = UserViewModel(view: self)
            userModel.loginUser(with: email, and: password) {(result) in
                if result == "" {
                    let tabViewController = self.storyboard?.instantiateViewController(identifier: "HomeTabs")
                        as? TabViewController
                    tabViewController?.username = userModel.getEmail(with: email, and: password)
                    self.navigationController?.pushViewController(tabViewController!, animated: true)
                } else {
                    self.showError(result)
                }
            }
        }
    }

    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}

extension LoginEmailViewController: UserViewProtocol {}
