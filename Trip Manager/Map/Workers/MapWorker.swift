//
//  MapWorker.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

final class MapWorker: MapWorkerProtocol {
    
    // MARK: - Vars
    var routes: [TripModel] = []
    
    // MARK: - Protocol Methods
    func mapRoutes(_ routes: [TripRestModel]) {
        
        self.routes.removeAll()
        
        // Filter Routes with bad coords
        let filteredRoutes = routes.filter({
            $0.origin?.point?.latitude != nil &&
            $0.origin?.point?.longitude != nil &&
            $0.destination?.point?.latitude != nil &&
            $0.destination?.point?.longitude != nil
        })
        
        // Transform From Rest Model
        let newRoutes = filteredRoutes.compactMap({
            TripModel(driverName: $0.driverName ?? "",
                       route: $0.route ?? "",
                       description: $0.description ?? "",
                       startTime: Utils.utcStringToDate($0.startTime ?? "") ?? Date(),
                       endTime: Utils.utcStringToDate($0.endTime ?? "") ?? Date(),
                       status: TripStatus.getStatusFromString($0.status ?? ""),
                       origin: PointModel(lat: $0.origin?.point?.latitude ?? 0, lon: $0.origin?.point?.longitude ?? 0, address: $0.origin?.address ?? ""),
                       destination: PointModel(lat: $0.destination?.point?.latitude ?? 0, lon: $0.destination?.point?.longitude ?? 0, address: $0.destination?.address ?? ""),
                       stops: ($0.stops ?? []).filter({ // Filter Stops with bad coords
                $0.point?.latitude != nil &&
                $0.point?.longitude != nil
            }).compactMap({ 
                StopModel(lat: $0.point?.latitude ?? 0, lon: $0.point?.longitude ?? 0, id: $0.id ?? -1)
            })
            )
        })
        
        self.routes = newRoutes
    }
    
    func totalRoutes() -> Int {
        return self.routes.count
    }
    
    func routeAtIndex(_ index: Int) -> TripModel? {
        return routes.indices.contains(index) ? routes[index] : nil
    }
    
    func getAnnotationsFor(_ index: Int) -> [MKPointAnnotation] {
        guard let model = routeAtIndex(index) else { return [] }
        
        var annotations: [MKPointAnnotation] = []
        
        annotations.append(model.origin.toAnnotation())
        annotations.append(model.destination.toAnnotation())

        let stopsAnnotations = model.stops.compactMap({ $0.toAnnotation() })
        annotations.append(contentsOf: stopsAnnotations)
        
        return annotations
    }
}
