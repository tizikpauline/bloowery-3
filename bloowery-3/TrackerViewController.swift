//
//  TrackerViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 18.06.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit

class TrackerViewController: UIViewController {
    @IBOutlet weak var containerViewImage: UIView!
    
    @IBOutlet weak var headerTitle: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var bodyContainer: UIView!
    
    @IBOutlet weak var PlantImage: UIImageView!
    
    @IBOutlet weak var PlantName: UILabel!
    
    @IBOutlet weak var SettingsButton: UIButton!
    
    @IBOutlet weak var HistoryButton: UIButton!
    
    @IBOutlet weak var PlantSort: UILabel!
    
    @IBOutlet weak var PlantAge: UILabel!
    
    @IBOutlet weak var PlantCondition: UILabel!
    
    @IBOutlet weak var waterParameter: UILabel!
    
    @IBOutlet weak var waterSubhead: UILabel!
    
    @IBOutlet weak var waterContainer: UIView!
    
    @IBOutlet weak var waterSlider: UISlider!
    
    @IBOutlet weak var waterMin: UILabel!
    
    @IBOutlet weak var waterMax: UILabel!
    
    @IBOutlet weak var temperatureParameter: UILabel!
    
    @IBOutlet weak var temperatureSubhead: UILabel!
    
    @IBOutlet weak var temperatureContainer: UIView!
    
    @IBOutlet weak var temperatureSlider: UISlider!
    
    @IBOutlet weak var temperatureMin: UILabel!
    
    @IBOutlet weak var temperatureMax: UILabel!
    
    @IBOutlet weak var humidityParamter: UILabel!
    
    @IBOutlet weak var humiditySubhead: UILabel!
    
    @IBOutlet weak var humidityContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         cornerRadius()
    }
    
    func cornerRadius() {
        waterContainer.layer.cornerRadius = 15
        waterContainer.layer.masksToBounds = true
        
        temperatureContainer.layer.cornerRadius = 15
        temperatureContainer.layer.masksToBounds = true
        
        humidityContainer.layer.cornerRadius = 15
        humidityContainer.layer.masksToBounds = true
        
        bodyContainer.layer.cornerRadius = 25
        bodyContainer.layer.masksToBounds = true
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
