//
//  MapViewControllerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

protocol MapViewControllerProtocol: class {
    func startLoading()
    func stopLoading()
    func updateListRoutes()
    func showAnnotations(_ annotations: [MKPointAnnotation])
}
