//
//  MapRouter.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

final class MapRouter: MapRouterProtocol {
    var viewController: MapViewController
    
    required init(viewController: MapViewController) {
        self.viewController = viewController
    }
    
    func showContactForm() {
        if let contactController = ContactFormRouter().getView() {
            contactController.modalPresentationStyle = .fullScreen
            self.viewController.present(contactController, animated: true)
        }
    }
}
