//
//  ContactFormPresenter.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

final class ContactFormPresenter: ContactFormPresenterProtocol {
    var viewController: ContactFormViewControllerProtocol
    
    required init(viewController: ContactFormViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func fieldStatus(_ value: Bool, type: ContactFormFieldType) {
        value ? viewController.showCorrectField(type) : viewController.showErrorField(type)
    }
    
    func formDataSaved() {
        viewController.showSuccessPopup()
    }
}
