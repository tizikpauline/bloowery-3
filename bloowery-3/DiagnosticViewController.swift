//
//  DiagnosticViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 26.04.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//
import UIKit

struct Plant {
    var imageName: String
    var plantName: String
}

class DiagnosticViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var labelDiagnostic: UILabel!
    
    @IBOutlet weak var plantsDCV: UICollectionView!
    
    var plants: [Plant] = [Plant(imageName: "Ficus", plantName: "Степуша"), Plant(imageName: "Succulent", plantName: "Хавроша"), Plant(imageName: "Maranta", plantName: "Мара")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "PlantCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
        bordersContainerView()
    }
    
    private func bordersContainerView() {
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
    }
    
    private func setupCollectionView() {
        plantsDCV.delegate = self
        plantsDCV.dataSource = self
        let nib = UINib(nibName: "PlantCollectionViewCell", bundle: nil)
        plantsDCV.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemForRow: CGFloat  = 2
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat  = 15
            
            let width = (plantsDCV.frame.width - (numberOfItemForRow-1) * interItemSpacing) / numberOfItemForRow
            let height = width * 1.2
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumInteritemSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            plantsDCV.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension DiagnosticViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = plantsDCV.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PlantCollectionViewCell
        
        card.plantImage.image = UIImage(named: plants[indexPath.item].imageName)
        card.plantName.text = String("\(plants[indexPath.item].plantName)")
        
        card.layer.cornerRadius = 5
        card.layer.masksToBounds = true
        
        
        return card
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: \(indexPath)")
    }
    
}
