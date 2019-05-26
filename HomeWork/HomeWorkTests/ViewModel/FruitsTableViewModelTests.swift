//
//  HomeWorkTests.swift
//  HomeWorkTests
//
//  Created by Ajay Odedra on 07/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import XCTest
@testable import HomeWork

class FruitsTableViewModelTests: XCTestCase {

    var fruitsTableViewModel:FruitsTableViewViewModel?
    
    // MARK: - getFruits
    func testNormalFruitsCells() {
        
        let appServerClient = MockAppServerClient()
        appServerClient.getFruitResult = .success(payload: [Fruit.with()])
        
        let viewModel = FruitsTableViewViewModel(appServerClient: appServerClient)
        viewModel.getFruits()
        viewModel.displayStats()
        
        guard case .some(.normal(_)) = viewModel.fruitCells.value.first else {
            XCTFail()
            return
        }
    }
    
    func testEmptyFruitsCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getFruitResult = .success(payload: [])
        
        let viewModel = FruitsTableViewViewModel(appServerClient: appServerClient)
        viewModel.getFruits()
        
        guard case .some(.empty) = viewModel.fruitCells.value.first else {
            XCTFail()
            return
        }
    }
    
    func testErrorFruitCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getFruitResult = .failure(AppServerClient.GetFailureReason.notFound)
        
        let viewModel = FruitsTableViewViewModel(appServerClient: appServerClient)
        viewModel.getFruits()
        
        guard case .some(.error(_)) = viewModel.fruitCells.value.first else {
            XCTFail()
            return
        }
    }

}

private final class MockAppServerClient: AppServerClient {
    var getFruitResult: AppServerClient.GetFruitssResult?
    
    override func getFruits(completion: @escaping AppServerClient.GetFruitsCompletion) {
        completion(getFruitResult!)
    }
}
