//
//  HTTP.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 18/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import Foundation

enum HTTP {
    case get
    
    func request(url: URL?,
                 header: [String: String] = ["Content-Type": "application/json"],
                 body: [String: Any] = [:],
                 completion: @escaping (Data?, HTTPURLResponse?, String?) -> Void = { data, response, error in }) {
        
        guard let url = url else {
            completion(nil, nil, "Erou! URL Invalida")
            return
        }
        
        switch self {
        case .get:
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()
        }
    }
}
