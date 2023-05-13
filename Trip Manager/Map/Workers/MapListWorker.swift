//
//  MapListWorker.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

final class MapListWorker: MapWorkerProtocol {
    var routes: [RouteModel] = []
    
    func mapRoutes(_ routes: [RouteRestModel]) {
        
        self.routes.removeAll()
        
        for route in routes {
            guard let name = route.driverName else { continue }
            guard let routePolyString = route.route else { continue }
            guard let description = route.description else { continue }
            guard let sTime = route.startTime, let sTimeDate = utcStringToDate(sTime) else { continue }
            guard let eTime = route.endTime, let eTimeDate = utcStringToDate(eTime) else { continue }
            guard let status = route.status else { continue }
            var statusEnum: RouteStatus = .unkown
            switch status {
            case "ongoing":
                statusEnum = .ongoing
            case "scheduled":
                statusEnum = .scheduled
            case "cancelled":
                statusEnum = .cancelled
            case "finalized":
                statusEnum = .finalized
            default:
                statusEnum = .unkown
            }
            
            guard let orig = route.origin, let lat = orig.point?.latitude, let lon = orig.point?.longitude else { continue }
            let origModel = PointModel(coords: CoordsModel(lat: lat, lon: lon), address: orig.address ?? "")
            
            guard let dest = route.destination, let lat = dest.point?.latitude, let lon = dest.point?.longitude else { continue }
            let destModel = PointModel(coords: CoordsModel(lat: lat, lon: lon), address: dest.address ?? "")
            
            guard let stops = route.stops else { continue }
            
            var stopsObj: [StopModel] = []
            for stop in stops {
                guard let lat = stop.point?.latitude, let lon = stop.point?.longitude, let id = stop.id else { continue }
                stopsObj.append(StopModel(coords: CoordsModel(lat: lat, lon: lon), id: id))
            }
            
            self.routes.append(RouteModel(driverName: name, route: routePolyString, description: description, startTime: sTimeDate, endTime: eTimeDate, status: statusEnum, origin: origModel, destination: destModel, stops: stopsObj))
        }
    }
    
    func totalRoutes() -> Int {
        return self.routes.count
    }
    
    func routeAtIndex(_ index: Int) -> RouteModel? {
        return routes.indices.contains(index) ? routes[index] : nil
    }
    
    func utcStringToDate(_ value: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.date(from: value)
    }
    
    func getAnnotationsFor(_ index: Int) -> [MKPointAnnotation] {
        guard let model = routeAtIndex(index) else { return [] }
        
        var annotations: [MKPointAnnotation] = []
        
        let startAnn: MKPointAnnotation = MKPointAnnotation()
        startAnn.coordinate = CLLocationCoordinate2D(latitude: model.origin.coords.lat, longitude: model.origin.coords.lon)
        startAnn.title = model.origin.address
        annotations.append(startAnn)
        
        let endAnn: MKPointAnnotation = MKPointAnnotation()
        endAnn.coordinate = CLLocationCoordinate2D(latitude: model.destination.coords.lat, longitude: model.destination.coords.lon)
        endAnn.title = model.destination.address
        annotations.append(endAnn)
        
        for stop in model.stops {
            let ann: MKPointAnnotation = MKPointAnnotation()
            ann.coordinate = CLLocationCoordinate2D(latitude: stop.coords.lat, longitude: stop.coords.lon)
            ann.title = "\(stop.id)"
            annotations.append(ann)
        }
        
        return annotations
    }
}
