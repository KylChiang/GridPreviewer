//
//  ServiceClient.swift
//  GridPreviewer
//
//  Created by Kyl Chiang on 2018/9/30.
//  Copyright © 2018 KaiYun Chiang. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Endpoint
enum ServiceClientEndPoint {
    case photo()
    
    var request: URLRequest {
        var components = URLComponents(string: baseURL)!
        components.path = path
        return URLRequest(url: components.url!)
    }
    
    // MARK: Private Functions
    private var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    private var path:String {
        switch self {
        case .photo(): return "/photos"
        }
    }
}

// MARK: - Client
struct ServiceClient {
    
    func fetchData(completion: @escaping ([Album]?) -> Void) {
        let urlRequest = ServiceClientEndPoint.photo().request
        
        Alamofire.request(urlRequest).responseJSON { (response) in

            guard let resultDictionaries = response.result.value as? [[String:Any]] else {
                // Did not get JSON object
                return
            }
            
            let albums = resultDictionaries.compactMap({ (albumDictionary) in
                return Album(dictionary: albumDictionary)
            })
            
            completion(albums)
        }
    }
    
}
