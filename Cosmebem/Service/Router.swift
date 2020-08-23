//
//  Router.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 18/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

// swiftlint:disable identifier_name
import Foundation

enum Router {
    case brand(brand: String)
    case productCategory(productCategory: String, productType: String = "")
    case productType(productType: String)
    case productTags(productTags: String, productType: String = "")
    case findProduct(id: String)
}

struct MakeupAPI {
    let hostname: String = "http://makeup-api.herokuapp.com/api/v1/products.json?"
    let hostNameFind: String = "http://makeup-api.herokuapp.com/api/v1/products/"
    let imageHostname: String = "http://s3.amazonaws.com/donovanbailey/products/api_featured_images/000/001/"
    
    var route: Router
    
    var url: URL? {
        switch route {
        case .brand(let brand):
            return URL(string: "\(hostname)brand=\(brand)")
            
        case .productCategory(let productCategory, let productType):
            return URL(string: "\(hostname)product_category=\(productCategory)&product_type=\(productType)")
            
        case .productType(let productType):
            return URL(string: "\(hostname)product_type=\(productType)")
            
        case .productTags(let productTags, let productType):
            return URL(string: "\(hostname)product_tags=\(productTags)&product_type=\(productType)")
            
        case .findProduct(let id):
            return URL(string: "\(hostNameFind)\(id).json")
        }
    }
}
