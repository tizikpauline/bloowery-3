//
//  TaskCollectionViewCell.swift
//  bloowery-3
//
//  Created by Полина Тизик on 26.04.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var checkboxButton: UIButton!
    
    @IBOutlet weak var taskInfo: UILabel!
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var plantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
