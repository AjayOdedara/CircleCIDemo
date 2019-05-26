//
//  FruitTableViewCellModel.swift
//  HomeWork
//
//  Created by Ajay Odedra on 04/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import Foundation

protocol FruitCellViewModel {
    var cellIndetity: String { get }
    var fruitItem: Fruit { get }
    var fruitName: String { get }
    var price: Double { get }
    var weight: Double { get }
}

extension Fruit: FruitCellViewModel {
    
    var cellIndetity: String {
        return "fruitCell"
    }
    
    var fruitItem: Fruit {
        return self
    }
    var fruitName: String {
        return type
    }
    var fruitPrice: Double {
        return price
    }
    var fruitWeight: Double {
        return weight
    }
}
