//
//  Giphy.swift
//  GiphySwift
//
//  Created by Matias Seijas on 9/12/16.
//  Copyright © 2016 Matias Seijas. All rights reserved.
//

import Foundation

struct Giphy {
    
    static let host = "api.giphy.com"
    static let apiVersion = "v1"
    static let baseUrl = "https://\(host)/\(apiVersion)"
    static let publicApiKey = "dc6zaTOxFJmzC"
    
    enum Rating {
        case y, g, pg, pg13, r
    }
    
    enum ApiKey {
        case `public`, `private`(key: String)
        
        var key: String {
            switch self {
            case .public: return publicApiKey
            case .private(let key): return key
            }
        }
    }
    
    private(set) static var apiKey = ApiKey.public.key
    
    func configure(with apiKey: ApiKey) {
        Giphy.apiKey = apiKey.key
    }
    
    static func request(_ endpoint: GiphyRequest.Gif) {
        print("SOMETHING SOMETHING")
        let urlRequest = URLRequest(url: endpoint.url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            print("data: \(data)")
            print("response: \(response)")
            print("error: \(error)")
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                
                print(json)
                
            }
        }.resume()
    }

}
