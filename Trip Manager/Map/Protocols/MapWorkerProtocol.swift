//
//  MapWorkerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

protocol MapWorkerProtocol: class {
    func mapRoutes(_ routes: [RouteRestModel])
    func totalRoutes() -> Int
    func routeAtIndex(_ index: Int) -> RouteModel?
    func getAnnotationsFor(_ index: Int) -> [MKPointAnnotation]
}
