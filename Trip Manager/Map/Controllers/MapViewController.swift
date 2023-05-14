//
//  MapViewController.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var interactor: MapInteractorProtocol?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let presenter = MapPresenter(viewController: self)
        let listRestWorker = MapListRestWorker()
        let mapWorker = MapListWorker()
        let interactor = MapInteractor(presenter: presenter, listRestWorker: listRestWorker, mapWorker: mapWorker)
        
        self.interactor = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configure()
        self.setCollectionViewAdditionalParams()
        self.registerCells()
        self.interactor?.fetchRoutes()
    }
    
    func showAnnotations(_ annotations: [MKPointAnnotation]) {
        let previousAnnotations = mapView.annotations.filter({ !($0 is MKUserLocation) })
        mapView.removeAnnotations(previousAnnotations)
        self.mapView.showAnnotations(annotations, animated: false)
    }
    
    private func configure() {
        mapView.layoutMargins = UIEdgeInsets(top: self.view.safeAreaInsets.top, left: 0, bottom: self.view.safeAreaInsets.bottom + self.collectionView.frame.size.height, right: 0)
    }
}

extension MapViewController: MapViewControllerProtocol {
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func updateListRoutes() {
        collectionView.reloadData()
    }
}
