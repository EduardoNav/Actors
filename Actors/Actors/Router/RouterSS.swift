//
//  RouterSS.swift
//  SimpsonSearch
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit

enum Flow {
    case startLoad
    case masterDetail
}

protocol RouterSSDelegate {
    func retrieveSegue(strSegue: String)
}

class RouterSS: NSObject {
    
    var delegate: RouterSSDelegate?
    
    func retrieveSegue(flow: Flow){
        if flow == .startLoad{
            delegate?.retrieveSegue(strSegue: "LoaderToSplitVC")
        } else if flow == .masterDetail {
            delegate?.retrieveSegue(strSegue: "")
        }
    }
    
}
