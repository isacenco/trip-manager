//
//  MapInteractor.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

final class MapInteractor: MapInteractorProtocol {
    
    // MARK: - Vars
    var presenter: MapPresenterProtocol?
    var tripsRestWorker: TripListRestWorkerProtocol?
    var mapWorker: MapWorkerProtocol?
    
    required init(presenter: MapPresenterProtocol? = nil, tripsRestWorker: TripListRestWorkerProtocol? = nil, mapWorker: MapWorkerProtocol? = nil) {
        self.presenter = presenter
        self.tripsRestWorker = tripsRestWorker
        self.mapWorker = mapWorker
    }
    
    // MARK: - Protocol Methods
    func fetchRoutes() {
        presenter?.startLoading()
        
        tripsRestWorker?.fetch(completion: { response in
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
    
    func routeAtIndex(_ index: Int) -> TripModel? {
        mapWorker?.routeAtIndex(index)
    }
    
    func selectRoute(_ index: Int) {
        self.presenter?.showAnnotations(self.mapWorker?.getAnnotationsFor(index) ?? [])
    }
}
