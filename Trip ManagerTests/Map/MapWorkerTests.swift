//
//  MapWorkerTests.swift
//  Trip ManagerTests
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import XCTest
@testable import Trip_Manager

final class MapWorkerTests: XCTestCase {
    
    var mapWorker: MapWorker?
    
    override func setUp() {
        super.setUp()
        mapWorker = MapWorker()
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
        
        let orig = PointRestModel(point: CoordsRestModel(latitude: 37.751, longitude: -97.822), address: "Girona")
        let dest = PointRestModel(point: CoordsRestModel(latitude: 37.851, longitude: -97.922), address: "Girona")
        let stop1 = StopRestModel(point: CoordsRestModel(latitude: 37.761, longitude: -97.832), id: 7)
        let stop2 = StopRestModel(point: CoordsRestModel(latitude: 37.771, longitude: -97.842), id: 8)
        
        let model = TripRestModel(driverName: "Ghena", status: "ongoing", route: "unknown", startTime: "2023-05-15T16:52:58+0000", origin: orig, description: "Test Route 1", destination: dest, stops: [stop1, stop2], endTime: "2023-05-15T16:56:12+0000")
        
        mapWorker?.mapRoutes([model])
        
        XCTAssertEqual(mapWorker?.totalRoutes(), 1)
        XCTAssertEqual(mapWorker?.routeAtIndex(0)?.stops.count, 2)
        
        
        
        // ADD Route whith bad coords
        let orig2 = PointRestModel(point: CoordsRestModel(latitude: nil, longitude: -97.822), address: "Girona")
        let dest2 = PointRestModel(point: CoordsRestModel(latitude: 37.851, longitude: -97.922), address: "Girona")
        let stop3 = StopRestModel(point: CoordsRestModel(latitude: 37.761, longitude: -97.832), id: 7)
        let stop4 = StopRestModel(point: CoordsRestModel(latitude: 37.771, longitude: -97.842), id: 8)
        
        let model2 = TripRestModel(driverName: "Ghena", status: "ongoing", route: "unknown", startTime: "2023-05-15T16:52:58+0000", origin: orig2, description: "Test Route 1", destination: dest2, stops: [stop3, stop4], endTime: "2023-05-15T16:56:12+0000")
        
        mapWorker?.mapRoutes([model, model2])
        
        XCTAssertEqual(mapWorker?.totalRoutes(), 1)
        
        let ann = mapWorker?.getAnnotationsFor(0)
        XCTAssertEqual(ann?.count, 4)
        
        // ADD Route whithout stops
        let orig3 = PointRestModel(point: CoordsRestModel(latitude: 37.751, longitude: -97.822), address: "Girona")
        let dest3 = PointRestModel(point: CoordsRestModel(latitude: 37.851, longitude: -97.922), address: "Girona")
        let model3 = TripRestModel(driverName: "Ghena", status: "ongoing", route: "unknown", startTime: "2023-05-15T16:52:58+0000", origin: orig3, description: "Test Route 1", destination: dest3, stops: nil, endTime: "2023-05-15T16:56:12+0000")
        
        mapWorker?.mapRoutes([model, model2, model3])
        
        XCTAssertEqual(mapWorker?.totalRoutes(), 2)
        let ann2 = mapWorker?.getAnnotationsFor(1)
        XCTAssertEqual(ann2?.count, 2)
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
