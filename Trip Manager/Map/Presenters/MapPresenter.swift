//
//  MapPresenter.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

final class MapPresenter: MapPresenterProtocol {
    weak var viewController: MapViewControllerProtocol?
    
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
}
