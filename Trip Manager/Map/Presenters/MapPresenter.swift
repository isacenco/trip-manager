//
//  MapPresenter.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import MapKit

final class MapPresenter: MapPresenterProtocol {
    
    // MARK: - Vars
    var viewController: MapViewControllerProtocol?
    
    required init(viewController: MapViewControllerProtocol? = nil) {
        self.viewController = viewController
    }
    
    // MARK: - Protocol Methods
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
