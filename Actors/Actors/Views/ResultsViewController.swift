//
//  ResultsViewController.swift
//  SimpsonSearch
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit
import Entities

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISplitViewControllerDelegate, UISearchBarDelegate {
    
    var arrEntity: [BaseEntity]?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableV: UITableView!
    var filteredObject: [BaseEntity]? = []
    var selectedObject: BaseEntity = BaseEntity()
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Actors"
        self.arrEntity = ElementsArr.shared.elements
        ElementsArr.shared.selected = ElementsArr.shared.elements![0]
        splitViewController?.delegate = self
        self.searchBar.delegate = self
        self.tableV.tableFooterView = UIView(frame: CGRect.zero)
        let textField: UITextField! = searchBar.value(forKey: "searchField") as? UITextField
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ResultsTableViewCell
        if (searchActive) {
           cell.lblName.text = filteredObject?[indexPath.row].strTitle
        } else {
            cell.lblName.text = arrEntity?[indexPath.row].strTitle
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchActive) {
            return filteredObject!.count
        } else {
            return arrEntity!.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (searchActive) {
            self.selectedObject = filteredObject![indexPath.row]
            ElementsArr.shared.selected = selectedObject
        } else {
            self.selectedObject = arrEntity![indexPath.row]
            ElementsArr.shared.selected = selectedObject
        }
        self.performSegue(withIdentifier: "segueResults", sender: self)
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.endEditing(true)
        searchActive = false;
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        print("Pressed")
        self.searchBar.showsCancelButton = false
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredObject = self.arrEntity?.filter({ (mod) -> Bool in
            return (mod.strTitle?.lowercased().contains(searchText.lowercased()))!
        })
        if(filteredObject!.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableV.reloadData()
    }
}


