//
//  ViewController.swift
//  fiebaseDiccionary
//
//  Created by Karim Ulises Salazar Garcia on 8/20/19.
//  Copyright © 2019 Karim Ulises Salazar Garcia. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
 

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var textField: UITextField!
   
    
   // searchBar
    private func setUpSearchBar() {
       searchBar.delegate = self
    
    }
    @IBOutlet weak var myTableMedican: UITableView!
    
    var diccionary:[String] = []
    var searching = false
    var handle: DatabaseHandle?
    var ref: DatabaseReference!
 
    
    
    
 //Setting up our table view
// extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
          return diccionary.count
        } else {
        return diccionary.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if searching {
            cell .textLabel?.text = diccionary[indexPath.row]
        } else {
       
            cell.textLabel?.text = diccionary[indexPath.row]
        }
       
    
       return cell
    }
    
        override func viewDidLoad(){
       super.viewDidLoad()
        


    
        // Do any additional setup after loading the view.
         ref = Database.database().reference()
 handle = ref?.child("diccionary").observe(.childAdded, with:{ (snapshot)in
            if let item = snapshot.value as? String
            {
                self.diccionary.append(item)
                self.myTableMedican.reloadData()
               //mainSearchBar.delegate = self
        }
    })
 }

           override func didReceiveMemoryWarning(){
            super.didReceiveMemoryWarning()

      }
  }


