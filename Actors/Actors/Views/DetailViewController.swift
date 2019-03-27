//
//  DetailViewController.swift
//  SimpsonSearch
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit
import Entities

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var charDescrption: UILabel!
    @IBOutlet weak var charImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.charImageView.image = ElementsArr.shared.selected?.imgDetailImage
        self.nameTitle.text = ElementsArr.shared.selected?.strTitle
        self.charDescrption.text = ElementsArr.shared.selected?.strSubTitle
    }

    
}
