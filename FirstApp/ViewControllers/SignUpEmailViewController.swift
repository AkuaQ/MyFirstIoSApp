//
//  SignUpEmailViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/10.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpEmailViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
            return "Please fill in all fields"
        }
        if lastName == "" {
            return "Please fill in all fields"
        }
        if email == "" {
            return "Please fill in all fields"
        }
        if password == "" {
            return "Please fill in all fields"
        }        //Check if password secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Constants.isPasswordValid(cleanedPassword) == false {
            //Password isn't secure enough
            return "Please make sure your password is at least characters, contains a special character and a number."
        }
        return nil
    }
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateField()
        if error != nil {
            //There's something wrnf with the fields, show the error message
        }
        else {
            //Create cleaned version of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            //Check for errors
                if err != nil {
                    //There was an error creating the user
                } else {
                    //User was created successfully, now store the first name and last name
                    let database = Firestore.firestore()
                    database.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid]) { (error) in
                        //if not nil then there was an error with creating first name and last name
                        if error != nil {
                            //Show error message
                        }
                    }
                }
            }
            //Transition to the home screen
            self.transitionToHome()
        }
    }
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
