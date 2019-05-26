//
//  Fruit.swift
//  HomeWork
//
//  Created by Ajay Odedra on 03/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import Foundation
import SwiftyJSON

struct FruitData: Codable {
    let fruit: [Fruit]
}

struct Fruit: Codable {
    let type: String
    let price: Double
    let weight: Double
}

/*
struct Fruit {
    fileprivate enum Constants {
        enum Keys {
            static let fruitType = "type"
            static let fruitPrice = "price"
            static let fruitWeight = "weight"
        }
    }
    
    let type: String
    let price: Double
    let weight: Double
}

extension Fruit {
    init?(json: [String:JSON] ) {
        guard let type = json[Constants.Keys.fruitType]?.string,
            let price = json[Constants.Keys.fruitPrice]?.double,
            let weight = json[Constants.Keys.fruitWeight]?.double
            else { return nil }
        
        self.type = type
        self.price = price
        self.weight = weight
    }
}

*/
