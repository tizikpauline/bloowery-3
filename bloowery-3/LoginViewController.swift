//
//  LoginViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 13.05.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
//        Hide the error label
        
        errorLabel.alpha = 0
        
//        Style the elements
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
//        Secure password
        passwordTextField.isSecureTextEntry = true
    }
    
//    Transition to Sign Up Page
    
    @IBAction func openSignUpPage(_ sender: Any) {
        transitionToSignUpPage()
    }
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        // TO DO: Validate the text fields
        func validateFields() -> String? {
        //        Check that all fields are filled in
                if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
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
        
//        Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? ViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    func transitionToSignUpPage() {
        let signUpViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.signUpViewController) as? SignUpViewController
        
        view.window?.rootViewController = signUpViewController
        view.window?.makeKeyAndVisible()
    }
    

}
