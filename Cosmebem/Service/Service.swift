//
//  Service.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 18/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import Foundation
import UIKit

class Service {
    static let shared = Service()
    
    private init() {}
    
    func findProductByBrand(with brand: String, completion: @escaping ([Product]?) -> Void) {
        let api = MakeupAPI(route: .brand(brand: brand))
        
        //unwranping
        guard let url = api.url else { return }
        HTTP.get.request(url: url) { (data, _ response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let results = try JSONDecoder().decode([Product].self, from: data)
                completion(results)
            } catch {
                print(error)
            }
        }
    }
    
    func findProductByCategory(productCategory: String, productType: String = "", completion: @escaping ([Product]?) -> Void) {
        let api = MakeupAPI(route: .productCategory(productCategory: productCategory, productType: productType))
        
        //unwranping
        guard let url = api.url else { return }
        HTTP.get.request(url: url) { (data, _ response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let results = try JSONDecoder().decode([Product].self, from: data)
                completion(results)

            } catch {
                print(error)
            }
        }
    }
    
    func findProductByType(productType: String, completion: @escaping ([Product]?) -> Void) {
        let api = MakeupAPI(route: .productType(productType: productType))
        
        //unwranping
        guard let url = api.url else { return }
        HTTP.get.request(url: url) { (data, _ response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let results = try JSONDecoder().decode([Product].self, from: data)
                completion(results)

            } catch {
                print(error)
            }
        }
    }
    
    func findProductByTag(productTags: String, productType: String = "", completion: @escaping ([Product]?) -> Void) {
        let api = MakeupAPI(route: .productTags(productTags: productTags, productType: productType))
        
        //unwranping
        guard let url = api.url else { return }
        HTTP.get.request(url: url) { (data, _ response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let results = try JSONDecoder().decode([Product].self, from: data)
                completion(results)

            } catch {
                print(error)
            }
        }
    }
}
