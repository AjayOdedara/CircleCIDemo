//
//  FruitTests.swift
//  HomeWorkTests
//
//  Created by Ajay Odedra on 07/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import HomeWork

class FruitTests: XCTestCase {
    
    func testSuccessfulInit() {
        
        let fruitData = [Fruit(type: "apple", price: 127, weight: 90),
                         Fruit(type: "banana", price: 120, weight: 80)]
        XCTAssertNotNil(FruitData(fruit: fruitData), "Data inits")
    }
}
