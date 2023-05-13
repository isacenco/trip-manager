//
//  MapPresenterProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

protocol MapPresenterProtocol: class {
    func startLoading()
    func showFetchResult()
    func showAnnotations(_ annotations: [MKPointAnnotation])
}
