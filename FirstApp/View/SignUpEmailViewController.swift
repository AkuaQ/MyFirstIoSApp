import UIKit
import Dev_Pod

class SignUpEmailViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        self.hideKeyboardWhenTappedAround()
    }

    func setUpElements() {
        //Hide the error label
        errorLabel.alpha = 0

        //Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }

    //Check the fields and validate that the data is correct.
    //If everything is correct, this method returns nil.
    //Otherwise, it returns the error message
    func validateField() -> String? {
        //Check that all fields are filled in
        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if firstName == "" {
            Utilities.styleErrorTextField(firstNameTextField)
            return "Please fill in all fields"
        }
        if lastName == "" {
            Utilities.styleErrorTextField(lastNameTextField)
            return "Please fill in all fields"
        }
        if email == "" {
            Utilities.styleErrorTextField(emailTextField)
            return "Please fill in all fields"
        }
        if password == "" {
            Utilities.styleErrorTextField(passwordTextField)
            return "Please fill in all fields"
        }        //Check if password secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Constants.isPasswordValid(cleanedPassword) == false {
            //Password isn't secure enough
            Utilities.styleErrorTextField(passwordTextField)
            return "Please make sure your password is at least characters, contains a special character and a number."
        }
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        setUpElements()
        let error = validateField()
        if error != nil {
            //There's something wrong with the fields, show the error message
            showError(error!)
        } else {
            //Create cleaned version of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //Create the user
            let userCreate = UserViewModel()
            userCreate.addUser(with: firstName, lastName: lastName, email: email, and: password) {(result) in
                if result == "" {
                    //Transition to the home screen
                    self.transitionToHome()
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

    func transitionToHome() {
        let tabViewController = storyboard?.instantiateViewController(identifier: "HomeTabs")
        self.navigationController?.pushViewController(tabViewController!, animated: true)
    }
}
