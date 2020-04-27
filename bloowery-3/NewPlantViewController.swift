//
//  NewPlantViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 27.04.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit

class NewPlantViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageContainerView: UIView!
    
    @IBOutlet weak var whiteContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bordersContainerView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    private func bordersContainerView() {
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        
        imageContainerView.layer.cornerRadius = 20
        imageContainerView.layer.masksToBounds = true
        
        whiteContainerView.layer.cornerRadius = 20
        whiteContainerView.layer.masksToBounds = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
