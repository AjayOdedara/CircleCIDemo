//
//  BindablTests.swift
//  HomeWorkTests
//
//  Created by Ajay Odedra on 07/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import XCTest
@testable import HomeWork

class BindableTests: XCTestCase {
    
    func testBind() {
        let bindable = Bindable(false)
        
        let expectListenerCalled = expectation(description: "Listener is called")
        bindable.bind { value in
            XCTAssert(value == true, "testBind failed, should have been true")
            expectListenerCalled.fulfill()
        }
        
        bindable.value = true
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testBindAndFire() {
        let bindable = Bindable(true)
        
        let expectListenerCalled = expectation(description: "Listener is called")
        bindable.bindAndFire { value in
            XCTAssert(value == true, "testBindAndFire failed, should have been true")
            expectListenerCalled.fulfill()
        }
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
}
