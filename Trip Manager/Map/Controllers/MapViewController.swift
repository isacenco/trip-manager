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
        let listRestWorker = TripsRestWorker()
        let mapWorker = MapWorker()
        let interactor = MapInteractor(presenter: presenter, tripsRestWorker: listRestWorker, mapWorker: mapWorker)
        
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
        mapView.delegate = self
        mapView.layoutMargins = UIEdgeInsets(top: self.view.safeAreaInsets.top, left: 0, bottom: self.view.safeAreaInsets.bottom + self.collectionView.frame.size.height, right: 0)
        //mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
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

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let stopView = Bundle.main.loadNibNamed("StopView", owner: self, options: nil)?.first as? StopView else { return }
        guard let id = (mapView.selectedAnnotations.first as? StopPointAnnotation)?.identifier else { return }
        
        stopView.setUp(id: id)
        
        view.addSubview(stopView)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if let stopView = view.subviews.filter({ $0 is StopView }).first as? StopView {
            stopView.removeFromSuperview()
        }
    }
}
