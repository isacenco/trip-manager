//
//  MapPresenter.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

final class MapPresenter: MapPresenterProtocol {
    var viewController: MapViewControllerProtocol?
    
    required init(viewController: MapViewControllerProtocol? = nil) {
        self.viewController = viewController
    }
    
    func startLoading() {
        self.viewController?.startLoading()
    }
    
    func showFetchResult() {
        self.viewController?.stopLoading()
        self.viewController?.updateListRoutes()
    }
    
    func showAnnotations(_ annotations: [MKPointAnnotation]) {
        self.viewController?.showAnnotations(annotations)
    }
}
