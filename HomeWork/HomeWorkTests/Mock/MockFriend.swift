//
//  MockFruit.swift
//  HomeWorkTests
//
//  Created by Ajay Odedra on 07/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import Foundation
@testable import HomeWork

extension Fruit {
    static func with(type: String = "apple",
                     price: Double = 159,
                     weight: Double = 90 ) -> Fruit
    {
        return Fruit(type: "apple", price: 127, weight: 90)
    }
}

