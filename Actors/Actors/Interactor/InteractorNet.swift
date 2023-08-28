//
//  InteractorNet.swift
//  SimpsonSearch
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit
import Entities
import NetworkingManager

protocol InteractorNetDelegate {
    func retriveObject(entityArray: [BaseEntity])
    func retrieveError(strError: String)
}

class InteractorNet: NSObject {
    
    var delegate: InteractorNetDelegate?
    var service: RESTManager = RESTManager()
    var imageService: ImageDownloaderManager = ImageDownloaderManager()
    let dispatchGroup = DispatchGroup()
    
    func retrieveDataFromNet(strEndPoint: String){
        var arrEnt: [BaseEntity] = []
        
        service.getOperationURL(urlStr: strEndPoint){(data, error) in
            if let dat = data {
                
                if let json = try? JSONSerialization.jsonObject(with: dat, options: []) as? [String : Any],
                    let queryDic = json?["RelatedTopics"] as? [[String : Any]]{
                    for n in queryDic{
                        let responseElement: BaseEntity = BaseEntity()
                        responseElement.strTitle = n["Text"] as? String ?? ""
                        let a = responseElement.strTitle!.components(separatedBy: "-")
                        responseElement.strTitle = "\(a[0])"
                        responseElement.strSubTitle = n["Text"] as? String ?? ""
                        let iconObject = n["Icon"] as? [String: Any]
                        responseElement.strUrlImage = iconObject?["URL"] as? String ?? ""
                        arrEnt.append(responseElement)
                    }
                    self.getListIm(elements: arrEnt)
                    
                }
            } else {
                self.delegate?.retrieveError(strError: "There was an error downloading info")
            }
        }
    }
    
    func getListIm(elements: [BaseEntity]){
        self.delegate?.retriveObject(entityArray: elements)
    }
    
}
