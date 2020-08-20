//
//  Product.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 18/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

// swiftlint:disable identifier_name

import Foundation

struct Product: Codable {
    let id: Int
    let brand: String?
    let name: String?
    let productDescription: String?
    let category: String?
    let productType: String?
    let tagList: [String]
    let apiFeaturedImage: String?
    let productColors: [ProductColor]

    enum CodingKeys: String, CodingKey {
        case id
        case brand
        case name
            case productDescription = "description"
        case category
        case productType = "product_type"
        case tagList = "tag_list"
        case apiFeaturedImage = "api_featured_image"
        case productColors = "product_colors"
    }
}

struct ProductColor: Codable {
    let hexValue: String?
    let colourName: String?

    enum CodingKeys: String, CodingKey {
        case hexValue = "hex_value"
        case colourName = "colour_name"
    }
}
