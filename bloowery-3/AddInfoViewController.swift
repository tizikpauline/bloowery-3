//
//  HomeViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 13.05.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class AddInfoViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
    //        Hide the error label
            
//            errorLabel.alpha = 0
            
    //        Style the elements
            
            Utilities.styleTextField(bioTextField)
            Utilities.styleFilledButton(nextButton)
            Utilities.styleHollowButton(skipButton)
        }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        transitionToProfilePage()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        transitionToProfilePage()
    }
    
    
    
    func transitionToProfilePage() {
        let profileViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.profileViewController) as? ProfileViewController
        
        view.window?.rootViewController = profileViewController
        view.window?.makeKeyAndVisible()
    }

}
