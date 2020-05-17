//
//  ProfileViewController.swift
//  bloowery-3
//
//  Created by Полина Тизик on 15.05.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit
import Firebase

struct Setting {
    var imageName: String
    var settingName: String
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var userpicImage: UIImageView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var plantsLabel: UILabel!
    
    @IBOutlet weak var profileActions: UICollectionView!
    
    var settings: [Setting] = [Setting(imageName: "edit", settingName: "Редактировать профиль"), Setting(imageName: "settings", settingName: "Настройки профиля"), Setting(imageName: "logout", settingName: "Выйти из аккаунта")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "ProfileCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    private func setupCollectionView() {
        profileActions.delegate = self
        profileActions.dataSource = self
        let nib = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        profileActions.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemForRow: CGFloat  = 1
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat  = 15
            
            let width = (profileActions.frame.width - (numberOfItemForRow-1) * interItemSpacing) / numberOfItemForRow
            let height = width / 6
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumInteritemSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            profileActions.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = profileActions.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProfileCollectionViewCell
        
        cell.iconImage.image = UIImage(named: settings[indexPath.item].imageName)
        cell.buttonName.setTitle("\(settings[indexPath.item].settingName)", for: .normal)
        
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: \(indexPath)")
    }
    
}
