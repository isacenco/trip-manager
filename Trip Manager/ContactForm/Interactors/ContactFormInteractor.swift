//
//  ContactFormInteractor.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

final class ContactFormInteractor: ContactFormInteractorProtocol {
    let dataWorker: ContactFormDataWorkerProtocol
    var presenter: ContactFormPresenterProtocol
    
    func validateField(type: ContactFormFieldType, value: String?) {
        presenter.fieldStatus(dataWorker.validateField(type: type, value: value), type: type)
    }
    
    required init(presenter: ContactFormPresenterProtocol, dataWorker: ContactFormDataWorkerProtocol) {
        self.presenter = presenter
        self.dataWorker = dataWorker
    }

    func saveFormData(_ model: ContactFormFieldModel) {
        if dataWorker.saveFormData(model) {
            presenter.formDataSaved()
        }
    }
}
