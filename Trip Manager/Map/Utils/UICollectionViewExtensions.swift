//
//  UICollectionViewExtensions.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import UIKit

internal extension UICollectionView {
    func registerCellNib<T: UICollectionViewCell>(_ : T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }
}
