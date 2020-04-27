//
//  MyCollView+Search.swift
//  bloowery-3
//
//  Created by Полина Тизик on 27.04.2020.
//  Copyright © 2020 Полина Тизик. All rights reserved.
//

import UIKit

extension MyPlantsViewController: UISearchBarDelegate {


    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered.removeAll(keepingCapacity: false)
        let predicateString = searchBar.text!
        filtered = items.filter( {$0.plantName.range(of: predicateString) != nil })
        filtered.sort { $0.plantName < $1.plantName }
        isSearching = (filtered.count == 0) ? false: true
        myPlantsCV?.reloadData()
    }
    
}
