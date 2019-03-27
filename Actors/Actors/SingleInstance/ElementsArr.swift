//
//  ElementsArr.swift
//  SimpsonSearch
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit
import Entities

class ElementsArr: NSObject {
    
    var elements: [BaseEntity]?
    var selected: BaseEntity?
    
    static let shared = ElementsArr(Elements: [], Selected: BaseEntity())
    
    init(Elements: [BaseEntity]?, Selected: BaseEntity?){
        self.elements = Elements
        self.selected = Selected
    }
    
}
