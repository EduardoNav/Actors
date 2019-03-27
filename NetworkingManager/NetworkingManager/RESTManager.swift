//
//  RESTManager.swift
//  ResearchBar
//
//  Created by Luis Eduardo Moreno Nava on 26/03/19.
//  Copyright © 2019 blc. All rights reserved.
//

import UIKit

public class RESTManager: NSObject {
    
    public func getOperationURL(urlStr: String, completion: ((Data?, Error?) -> Void)?) {
        let uri: URL? = URL(string: urlStr)
        guard let url = uri else { fatalError("Could not create URL from components") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion!(nil, error)
                } else if let jsonData = responseData {
                    completion!(jsonData, nil)
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion!(nil, error)
                }
            }
        }
        task.resume()
    }

}
