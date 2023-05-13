//
//  MapViewController+UICollectionView.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import UIKit

extension MapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func registerCells() {
        self.collectionView.registerCellNib(RouteCollectionViewCell.self)
        //self.collectionView.register(RouteCollectionViewCell.self, forCellWithReuseIdentifier: "RouteCollectionViewCell")
//        self.collectionView.register(UINib(nibName: "RouteCollectionViewCell", bundle: nil), forSupplementaryViewOfKind: "RouteCollectionViewCell", withReuseIdentifier: "RouteCollectionViewCell")
        
    }
    
    func setCollectionViewAdditionalParams() {
        self.collectionView.backgroundView = nil;
        self.collectionView.backgroundColor = .clear
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.interactor?.totalRoutes() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RouteCollectionViewCell", for: indexPath) as? RouteCollectionViewCell else { return UICollectionViewCell() }
        guard let model = self.interactor?.routeAtIndex(indexPath.row) else { return UICollectionViewCell() }
        cell.setup(with: model)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
