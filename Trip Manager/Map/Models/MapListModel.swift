//
//  MapListModel.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

enum RouteStatus {
    case ongoing
    case scheduled
    case cancelled
    case finalized
    case unkown
}

struct RouteModel {
    let driverName, route, description: String
    let startTime, endTime: Date
    let status: RouteStatus
    let origin, destination: PointModel
    let stops: [StopModel]
    
    func startTimeFormatted() -> String {
        return Utils().dateToString(self.startTime)
    }
    
    func endTimeFormatted() -> String {
        return Utils().dateToString(self.endTime)
    }
}

struct PointModel {
    let coords: CoordsModel
    let address: String
}

struct StopModel {
    let coords: CoordsModel
    let id: Int
}

struct CoordsModel {
    let lat, lon: Double
}
