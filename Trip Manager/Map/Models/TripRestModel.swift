//
//  TripRestModel.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import Alamofire

public enum RestResult<T, U> {
    case success(T)
    case error(U)
}

public typealias RestResponse<Value> = ((RestResult<Value, NSError>) -> Void)

    // MARK: - Route
struct TripRestModel: Codable {
    let driverName, status, route, startTime: String?
    let origin: PointRestModel?
    let description: String?
    let destination: PointRestModel?
    let stops: [StopRestModel]?
    let endTime: String?
}

    // MARK: - Destination
struct PointRestModel: Codable {
    let point: CoordsRestModel?
    let address: String?
}

    // MARK: - Point
struct CoordsRestModel: Codable {
    let latitude, longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "_latitude"
        case longitude = "_longitude"
    }
}

    // MARK: - Stop
struct StopRestModel: Codable {
    let point: CoordsRestModel?
    let id: Int?
}
