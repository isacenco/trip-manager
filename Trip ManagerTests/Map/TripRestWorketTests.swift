//
//  TripRestWorketTests.swift
//  Trip ManagerTests
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import XCTest
@testable import Trip_Manager

final class TripRestWorketTests: XCTestCase {
    
    var tripRestWorker: TripsRestWorker?
    
    override func setUp() {
        super.setUp()
        tripRestWorker = TripsRestWorker()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        
        let expec = expectation(description: "wait")
        
        var restModel: [TripRestModel] = []
        
        tripRestWorker?.fetch(completion: { response in
            switch response {
            case .success(let model):
                restModel = model
                
                expec.fulfill()
                
                break
            case .error(_):
                XCTFail()
            }
        })
        
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertEqual(restModel.count, 7)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
