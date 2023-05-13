//
//  MapViewControllerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

protocol MapViewControllerProtocol: class {
    func startLoading()
    func stopLoading()
    func updateListRoutes()
}
