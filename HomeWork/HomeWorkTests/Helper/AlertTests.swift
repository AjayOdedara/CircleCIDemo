//
//  AlertTests.swift
//  HomeWorkTests
//
//  Created by Ajay Odedra on 07/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import XCTest
@testable import HomeWork

class AlertTests: XCTestCase {
    
    func testAlert() {
        let expectAlertActionHandlerCall = expectation(description: "Alert action handler called")
        
        let alert = SingleButtonAlert(
            title: "",
            message: "",
            action: AlertAction(buttonTitle: "", handler: {
                expectAlertActionHandlerCall.fulfill()
            })
        )
        
        alert.action.handler!()
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
}
