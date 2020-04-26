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

class MyPlantsViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var myPlantsLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func addPlantButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var myPlantsCV: UICollectionView!
    
//    @IBOutlet weak var searchBarPlaceholder: UIView!
    
    var items: [Item] = [Item(imageName: "Ficus", plantName: "Степуша"), Item(imageName: "Succulent", plantName: "Хавроша"), Item(imageName: "Maranta", plantName: "Мара")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "PlantCollectionViewCell"
    
//    var filteredData: [String]!
    var filteredData = [Item]()
    var searchActive = false
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        searchBar.delegate = self
        filteredData = items
//
//        searchController.searchBar.sizeToFit()
//        searchBarPlaceholder.addSubview(searchController.searchBar)
//        automaticallyAdjustsScrollViewInsets = false
//        definesPresentationContext = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
        bordersContainerView()
        setupColor()
    }
    
    func setupColor() {
        searchBar.isTranslucent = false
        searchBar.barTintColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
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
    
//    search bar function
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        // When there is no text, filteredData is the same as the original data
//        // When user has entered text into the search box
//        // Use the filter method to iterate over all items in the data array
//        // For each item, return true if the item should be included and false if the
//        // item should NOT be included
//        filteredData = searchText.isEmpty ? items : items.filter { (item: String) -> Bool in
//            // If dataItem matches the searchText, return true to include it
//            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        }
//
//        myPlantsCV.reloadData()
//    }
    
    func searchBar(searchText: String) {
        filteredData = items.filter { (item) -> Bool in
            return item.plantName.range(of: searchText, options: [ .caseInsensitive ]) != nil
        }

        searchActive = !filteredData.isEmpty

        myPlantsCV.reloadData()
    }
}

extension MyPlantsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = myPlantsCV.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PlantCollectionViewCell
        
        card.plantImage.image = UIImage(named: items[indexPath.item].imageName)
        card.plantName.text = String("\(items[indexPath.item].plantName)")
        
        card.layer.cornerRadius = 5
        card.layer.masksToBounds = true
        
        
        return card
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: \(indexPath)")
    }
    
}
