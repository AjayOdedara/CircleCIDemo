//
//  FruitDetailViewModel.swift
//  HomeWorkTests
//
//  Created by Ajay Odedra on 07/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import XCTest
@testable import HomeWork
class FruitDetailViewModelTest: XCTestCase {

    var fruitDetailViewModel:FruitDetailViewModel?
    
    
    func testFruitDetailModel(){
        fruitDetailViewModel = FruitDetailViewModel(fruit: Fruit.with())
        fruitDetailViewModel?.displayStats()
    }

}
