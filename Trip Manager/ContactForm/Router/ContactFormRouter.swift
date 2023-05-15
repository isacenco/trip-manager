//
//  ContactFormRouter.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import UIKit

final class ContactFormRouter: ContactFormRouterProtocol {
    func getView() -> ContactFormViewController? {
        let storyboard = UIStoryboard(name: "ContactForm", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ContactFormViewController") as? ContactFormViewController else { return nil }
        
        let dataWorker = ContactFormDataWorker()
        let presenter = ContactFormPresenter(viewController: viewController)
        let interactor = ContactFormInteractor(presenter: presenter, dataWorker: dataWorker)
        viewController.interator = interactor
        
        return viewController
    }
}
