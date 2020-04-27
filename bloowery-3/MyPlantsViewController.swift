//
//  MyPlantsViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 26.04.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit

struct Item {
    var imageName: String
    var plantName: String
}

fileprivate let searchBarHeight: Int = 40

class MyPlantsViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var myPlantsLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func addPlantButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var myPlantsCV: UICollectionView!
    
    var items: [Item] = [Item(imageName: "Ficus", plantName: "Степуша"), Item(imageName: "Succulent", plantName: "Хавроша"), Item(imageName: "Maranta", plantName: "Мара")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "PlantCollectionViewCell"
    
    var filtered: [Item] = []
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

        searchBar.delegate = self

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
        bordersContainerView()
        setupColor()
    }
    
    func setupColor() {
//        searchBar.isTranslucent = false
//        searchBar.barTintColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
    }
    
    private func bordersContainerView() {
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
    }
    

    private func setupCollectionView() {
        myPlantsCV.delegate = self
        myPlantsCV.dataSource = self
        let nib = UINib(nibName: "PlantCollectionViewCell", bundle: nil)
        myPlantsCV.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemForRow: CGFloat  = 2
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat  = 15
            
            let width = (myPlantsCV.frame.width - (numberOfItemForRow-1) * interItemSpacing) / numberOfItemForRow
            let height = width * 1.2
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumInteritemSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            myPlantsCV.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension MyPlantsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isSearching {
            return filtered.count
        }
    
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = myPlantsCV.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PlantCollectionViewCell
        
        card.plantImage.image = UIImage(named: items[indexPath.item].imageName)
        card.plantName.text = String("\(items[indexPath.item].plantName)")
        
        card.layer.cornerRadius = 5
        card.layer.masksToBounds = true
        
        if isSearching {
            card.plantName.text = filtered[indexPath.item].plantName
            // cell.nameLabel.text = filtered[indexPath.row].name
        } else {
            card.plantName.text = items[indexPath.item].plantName
        }
        
        return card
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: \(indexPath)")
    }
    
}
