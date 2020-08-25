//
//  OnboardUITests.swift
//  CosmebemUIT
//
//  Created by Beatriz Carlos on 25/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import XCTest

@testable import Cosmebem

class OnboardUITests: XCTestCase {
    func test_onboardButton_actionables() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-reset"]
        app.launch()
        
        let button = XCUIApplication().staticTexts["START"]
        XCTAssertTrue(button.isHittable)
        button.tap()
    }
    
    func test_collectionViewTag_destinationTag() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-skipOnboarding"]
        app.launch()
        
        let cellsQuery = app.collectionViews.cells
        
        let elementOrganic = cellsQuery.otherElements.containing(.staticText, identifier: "Organic").element
        XCTAssertTrue(elementOrganic.isHittable)
        elementOrganic.tap()
        
        let backButton = app.navigationBars["Organic"].buttons["Trendings"]
        XCTAssertTrue(backButton.isHittable)
        backButton.tap()
        
        let elementCruelty = cellsQuery.otherElements.containing(.staticText, identifier: "Cruelty free").element
        XCTAssertTrue(elementCruelty.isHittable)
        elementCruelty.tap()
        
        let backButtonCruelty = app.navigationBars["Cruelty free"].buttons["Trendings"]
        XCTAssertTrue(backButtonCruelty.isHittable)
        backButtonCruelty.tap()
        
        let elementHypoalergenic = cellsQuery.otherElements.containing(.staticText, identifier: "Hypoalergenic").element
        XCTAssertTrue(elementHypoalergenic.isHittable)
        elementHypoalergenic.tap()
        
        let backButtonHypoalergenic = app.navigationBars["Hypoallergenic"].buttons["Trendings"]
        XCTAssertTrue(backButtonHypoalergenic.isHittable)
        backButtonHypoalergenic.tap()
        
        let elementOil = cellsQuery.otherElements.containing(.staticText, identifier: "Oil free").element
        XCTAssertTrue(elementOil.isHittable)
        elementOil.tap()
        
        let backButtonOilFree = app.navigationBars["Oil free"].buttons["Trendings"]
        XCTAssertTrue(backButtonOilFree.isHittable)
        backButtonOilFree.tap()
    }
    
    func test_comesticosTableView_destinationDescriptionCosmetics() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-skipOnboarding"]
        app.launch()
        
        let tabBarButton = app.tabBars.buttons["Cosmetics"]
        XCTAssertTrue(tabBarButton.isHittable)
        tabBarButton.tap()
        
        let backButon = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Blush"]/*[[".cells.staticTexts[\"Blush\"]",".staticTexts[\"Blush\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(backButon.isHittable)
        backButon.tap()
    }
    
    func test_tagTableView_destinationDescriotionCosmetics() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-skipOnboarding"]
        app.launch()
        
        let tabBarButton = app.tabBars.buttons["Tags"]
        XCTAssertTrue(tabBarButton.isHittable)
        tabBarButton.tap()
        
        let tableView = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Hypoallergenic"]/*[[".cells.staticTexts[\"Hypoallergenic\"]",".staticTexts[\"Hypoallergenic\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(tabBarButton.isHittable)
        tableView.tap()
        
        let collectionView = app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        XCTAssertTrue(collectionView.isHittable)
        collectionView.tap()
        
        let backButton = app.buttons["Cancel"]
        XCTAssertTrue(backButton.isHittable)
        backButton.tap()
    }
}
