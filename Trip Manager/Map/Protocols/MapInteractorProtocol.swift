//
//  MapInteractorProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

protocol MapInteractorProtocol: class {
    func fetchRoutes()
    func totalRoutes() -> Int
    func routeAtIndex(_ index: Int) -> RouteModel?
    func selectRoute(_ index: Int)
}
