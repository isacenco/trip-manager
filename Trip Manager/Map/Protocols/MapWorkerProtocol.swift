//
//  MapWorkerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

protocol MapWorkerProtocol: class {
    func mapRoutes(_ routes: [RouteRestModel])
    func totalRoutes() -> Int
    func routeAtIndex(_ index: Int) -> RouteModel?
}
