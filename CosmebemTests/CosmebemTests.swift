//
//  CosmebemTests.swift
//  CosmebemTests
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import XCTest
@testable import Cosmebem

class CosmebemTests: XCTestCase {
    func test_route_brandRoute_brand() {
        let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")
        let expect = expectation(description: "getting all produs brand maybeline")
        guard let urlMakeupAPI: URL = MakeupAPI(route: Router.brand(brand: "maybelline")).url else {return}
        XCTAssertEqual(url, urlMakeupAPI)
        expect.fulfill()
        wait(for: [expect], timeout: 5)
    }
    
    func test_route_productCategoryRoute_productCategory() {
        let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?product_category=liquid&product_type=")
        let expect = expectation(description: "getting all products by catgeorie liquid.")
        guard let urlMakeupAPI: URL = MakeupAPI(route: Router.productCategory(productCategory: "liquid", productType: "")).url else {return}
        XCTAssertEqual(url, urlMakeupAPI)
        expect.fulfill()
        //Async
        
        wait(for: [expect], timeout: 5)
    }
    
    func test_route_productTypeRoute_productType() {
        let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=blush")
        let expect = expectation(description: "getting all products by type blush.")
        guard let urlMakeupAPI: URL = MakeupAPI(route: Router.productType(productType: "blush")).url else {return}
        XCTAssertEqual(url, urlMakeupAPI)
        expect.fulfill()
        //Async
        
        wait(for: [expect], timeout: 5)
    }
    
    func test_route_productTagsRoute_productTags() {
        let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?product_tags=vegan&product_type=")
        let expect = expectation(description: "getting all products by tag vegan.")
        guard let urlMakeupAPI: URL = MakeupAPI(route: Router.productTags(productTags: "vegan", productType: "")).url else {return}
        XCTAssertEqual(url, urlMakeupAPI)
        expect.fulfill()
        //Async
        
        wait(for: [expect], timeout: 5)
    }
    
    func test_route_productByIdRoute_productById() {
        let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products/90.json")
        let expect = expectation(description: "getting all product by id.")
        guard let urlMakeupAPI: URL = MakeupAPI(route: Router.findProduct(id: "90")).url else {return}
        XCTAssertEqual(url, urlMakeupAPI)
        expect.fulfill()
        //Async
        
        wait(for: [expect], timeout: 5)
    }
}
