//
//  searchBarr.swift
//  fiebaseDiccionary
//
//  Created by Karim Ulises Salazar Garcia on 9/20/19.
//  Copyright © 2019 Karim Ulises Salazar Garcia. All rights reserved.
//

import UIKit
import FirebaseDatabase
extension ViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("begin editing")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end editing")
    
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = diccionary.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        myTableMedican.reloadData()
    }

}
        
        
    

