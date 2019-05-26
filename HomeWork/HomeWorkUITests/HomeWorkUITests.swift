//
//  HomeWorkUITests.swift
//  HomeWorkUITests
//
//  Created by Ajay Odedra on 08/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import XCTest

class HomeWorkUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    func testFruitCellDetail(){
        let app = XCUIApplication.init()
        app.cells.element(boundBy: 0).tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.cells.element(boundBy: 1).tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.cells.element(boundBy: 2).tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
    }
    func testFruitCellsRecs(){
        let app = XCUIApplication.init()
        let fruitsButton = app.navigationBars["Fruit Details"].buttons["Fruits"]
        
        let tablesQuery = app.tables
        
        tablesQuery/*@START_MENU_TOKEN@*/.cells.staticTexts["BANANA"]/*[[".cells.staticTexts[\"BANANA\"]",".staticTexts[\"BANANA\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        fruitsButton.tap()
        
        tablesQuery/*@START_MENU_TOKEN@*/.cells.staticTexts["ORANGE"]/*[[".cells.staticTexts[\"ORANGE\"]",".staticTexts[\"ORANGE\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        fruitsButton.tap()
        
        tablesQuery.cells.staticTexts["KIWI"].tap()
        fruitsButton.tap()

    }
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
