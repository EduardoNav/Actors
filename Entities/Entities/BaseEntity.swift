//
//  BaseEntity.swift
//  Entities
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 lalonav. All rights reserved.
//

import UIKit

public class BaseEntity: NSObject {
    
    public var strTitle: String?
    public var strSubTitle: String?
    public var strUrlImage: String?
    public var imgDetailImage: UIImage?
    
    public override init() {
        self.strTitle = ""
        self.strSubTitle = ""
        self.strUrlImage = ""
        self.imgDetailImage = UIImage()
    }
    
    public init(StrTitle: String?, StrSubTitle: String?, StrImage: String?, Img: UIImage?){
        self.strTitle = StrTitle ?? ""
        self.strSubTitle = StrSubTitle ?? ""
        self.strUrlImage = StrImage ?? ""
        self.imgDetailImage = Img ?? UIImage()
    }
    
}
