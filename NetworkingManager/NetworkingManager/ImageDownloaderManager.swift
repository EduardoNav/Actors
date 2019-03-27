//
//  ImageDownloaderManager.swift
//  ResearchBar
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 blc. All rights reserved.
//

import UIKit

public class ImageDownloaderManager: NSObject {
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    public func getImage(from url: URL, completion: @escaping (UIImage)->()){
        var ima: UIImage? = UIImage()
        print("Download Started")
        self.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                ima = UIImage(data: data)
                completion(ima!)
            }
        }
    }
    
    
}
