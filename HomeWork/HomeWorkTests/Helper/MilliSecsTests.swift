//
//  MilliSecsTests.swift
//  HomeWorkTests
//
//  Created by Ajay Odedra on 07/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import XCTest
@testable import HomeWork

class MilliSecsTests: XCTestCase {

    func testMilliSecs(){
        let expectAlertActionHandlerCall = expectation(description: "Seconds Cnverted")
        
        // Mock Dates
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd H:m:ss.SSS"
        let pastDate = dateFormatter.date(from: "2019-04-07 19:01:04.770")
        let afterExcDate = dateFormatter.date(from: "2019-04-07 19:01:04.800")
        
        guard let aftDate = afterExcDate, let preDate = pastDate else{
            return
        }
        
        let ms = aftDate.millSecs(from: preDate)
        if ms == "30.00"{
            expectAlertActionHandlerCall.fulfill()
        }
        waitForExpectations(timeout: 0.1, handler: nil)
    }

}
