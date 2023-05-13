//
//  MapInteractor.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

final class MapInteractor: MapInteractorProtocol {
    var presenter: MapPresenterProtocol?
    var listRestWorker: MapListRestWorkerProtocol?
    var mapWorker: MapWorkerProtocol?
    
    required init(presenter: MapPresenterProtocol? = nil, listRestWorker: MapListRestWorkerProtocol? = nil, mapWorker: MapWorkerProtocol? = nil) {
        self.presenter = presenter
        self.listRestWorker = listRestWorker
        self.mapWorker = mapWorker
    }
    
    func fetchRoutes() {
        presenter?.startLoading()
        
        listRestWorker?.fetch(completion: { response in
            switch response {
            case .success(let model):
                self.mapWorker?.mapRoutes(model)
                
                self.presenter?.showFetchResult()
                break
            case .error(_):
                break
            }
        })
    }
    
    func totalRoutes() -> Int {
        return mapWorker?.totalRoutes() ?? 0
    }
    
    func routeAtIndex(_ index: Int) -> RouteModel? {
        mapWorker?.routeAtIndex(index)
    }
    
    func selectRoute(_ index: Int) {
        self.presenter?.showAnnotations(self.mapWorker?.getAnnotationsFor(index) ?? [])
    }
}
