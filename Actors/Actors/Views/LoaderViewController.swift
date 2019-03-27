//
//  LoaderViewController.swift
//  SimpsonSearch
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit
import Entities

class LoaderViewController: UIViewController, PresentorNetDelegate {
    
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    let presentor: PresentorNet = PresentorNet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loaderActivityIndicator.startAnimating()
        self.presentor.delegate = self
        self.presentor.retrieveDataFromNet(strEndPoint: "http://api.duckduckgo.com/?q=the+wire+characters&format=json")
    }
    
    func retriveObject(entityArray: [BaseEntity]) {
        ElementsArr.shared.elements = entityArray
        self.presentor.retrieveSegue(flow: .startLoad)
        
    }
    
    func retrieveSegue(strSegue: String) {
        self.loaderActivityIndicator.stopAnimating()
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: strSegue, sender: self)
        }
    }
    
    func retrieveError(strError: String) {
        self.addAlert(strM: strError)
    }
    
    func addAlert(strM: String){
        let alert = UIAlertController(title: "Error", message: strM, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
