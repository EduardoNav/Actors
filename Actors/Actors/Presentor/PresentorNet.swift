//
//  PresentorNet.swift
//  SimpsonSearch
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit
import Entities

protocol PresentorNetDelegate {
    func retriveObject(entityArray: [BaseEntity])
    func retrieveSegue(strSegue: String)
    func retrieveError(strError: String)
}

class PresentorNet: NSObject, RouterSSDelegate, InteractorNetDelegate {
    
    var delegate: PresentorNetDelegate?
    let router: RouterSS = RouterSS()
    let interactor: InteractorNet = InteractorNet()
    
    func retrieveDataFromNet(strEndPoint: String){
        self.interactor.delegate = self
        self.interactor.retrieveDataFromNet(strEndPoint: strEndPoint)
    }
    
    func retriveObject(entityArray: [BaseEntity]){
        self.delegate?.retriveObject(entityArray: entityArray)
    }
    
    func retrieveSegue(flow: Flow){
        self.router.delegate = self
        router.retrieveSegue(flow: flow)
    }
    
    func retrieveSegue(strSegue: String) {
        delegate?.retrieveSegue(strSegue: strSegue)
    }
    
    func retrieveError(strError: String) {
        delegate?.retrieveError(strError: strError)
    }
    
}

