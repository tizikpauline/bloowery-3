//
//  SignUpViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 13.05.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var createAccount: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
//        Hide the error label
        
        errorLabel.alpha = 0
        
//        Style the elements
        
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(phoneTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
//    Transition to login page
    @IBAction func openLoginPage(_ sender: Any) {
        transitionToLoginPage()
    }
    
    
//    Check the fields and validate that the data is correct if everythiing is correct. If everything is correct, this method returns the error message

    func validateFields() -> String? {
//        Check that all fields are filled in
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Пожалуйста, заполните все поля."
        }
        
//        Check if the password is secure
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanPassword) == false {
//            Password is not securer enough
            return "Пожалуйста, удостоверьтесь, что ваш пароль состоит минимум из 8 символов и содержит специальные символы и цифры."
        }
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
//        validate the fields
        let error = validateFields()
        
        if error != nil {
//            There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
//            Create versions of the data
            let userName = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneNumber = phoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
// Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // check for errors
                if err != nil {
                    
                    // there was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    // user was created successfully, now store the user name and phone number
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["username": userName, "phoneNumber": phoneNumber, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // transition to the home screen
                    self.transitionToHome()
                    
                }
            }

        }

    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let addInfoViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.addInfoViewController) as? AddInfoViewController
        
        view.window?.rootViewController = addInfoViewController
        view.window?.makeKeyAndVisible()
    }
    
    func transitionToLoginPage() {
        let loginViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController
        
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
    }

}
