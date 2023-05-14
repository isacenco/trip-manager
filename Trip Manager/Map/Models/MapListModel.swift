//
//  MapListModel.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

enum RouteStatus {
    case ongoing
    case scheduled
    case cancelled
    case finalized
    case unkown
    
    static func getStatusFromString(_ value: String) -> RouteStatus {
        switch value {
        case "ongoing":
            return .ongoing
        case "scheduled":
            return .scheduled
        case "cancelled":
            return .cancelled
        case "finalized":
            return .finalized
        default:
            return .unkown
        }
    }
}

struct RouteModel {
    let driverName, route, description: String
    let startTime, endTime: Date
    let status: RouteStatus
    let origin, destination: PointModel
    let stops: [StopModel]
    
    func startTimeFormatted() -> String {
        return Utils.dateToString(self.startTime)
    }
    
    func endTimeFormatted() -> String {
        return Utils.dateToString(self.endTime)
    }
    
    func statusFormatted() -> String {
        switch status {
        case .scheduled:
            return "Scheduled"
        case .ongoing:
            return "Ongoing"
        case .finalized:
            return "Finalized"
        case .cancelled:
            return "Canceled"
        default:
            return "Unknown"
        }
    }
}

class PointModel: CoordsModel {
    var address: String = ""
    
    init(lat: Double, lon: Double, address: String) {
        super.init(lat: lat, lon: lon)
        self.address = address
    }
    
    override func toString() -> String {
        return address + super.toString()
    }
    
    override func toAnnotation() -> MKPointAnnotation {
        let annotation = super.toAnnotation()
        annotation.title = address
        return annotation
    }
}

class StopModel: CoordsModel {
    var id: Int = -1
    
    init(lat: Double, lon: Double, id: Int) {
        super.init(lat: lat, lon: lon)
        self.id = id
    }
}

class CoordsModel {
    var lat, lon: Double
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    func toString() -> String {
        return "\(lat), \(lon)"
    }
    
    func toAnnotation() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        return annotation
    }
}
