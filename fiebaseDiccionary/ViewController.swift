//
//  ViewController.swift
//  fiebaseDiccionary
//
//  Created by Karim Ulises Salazar Garcia on 8/20/19.
//  Copyright © 2019 Karim Ulises Salazar Garcia. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var myTableMedican: UITableView!

  var diccionary:[String] = []
  var diccionaryFilter:[String] = []
  var searching = false
  var handle: DatabaseHandle?
  var ref: DatabaseReference!


  override func viewDidLoad(){
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    fetchDictionary()
  }

  override func didReceiveMemoryWarning(){
    super.didReceiveMemoryWarning()
  }


  func fetchDictionary() {
    ref = Database.database().reference()
    handle = ref?.child("diccionary").observe(.childAdded, with:{ (snapshot)in
      if let item = snapshot.value as? String
      {
        self.diccionary.append(item)
        self.myTableMedican.reloadData()
      }
    })
  }
}


extension ViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText == ""  {
      searching = false
      myTableMedican.reloadData()
    } else {
      searching = true
      diccionaryFilter = diccionary.filter { $0.contains(searchText) }
      if diccionaryFilter.isEmpty {
        myTableMedican.reloadData()
      } else {
        myTableMedican.reloadData()
      }
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searching == false {
      return diccionary.count
    } else {
      return diccionaryFilter.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    if searching == false {
      cell .textLabel?.text = diccionary[indexPath.row]
    } else {
      cell.textLabel?.text = diccionaryFilter[indexPath.row]
    }
    return cell
  }
}
