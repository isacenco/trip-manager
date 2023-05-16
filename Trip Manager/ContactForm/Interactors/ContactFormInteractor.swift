//
//  ContactFormInteractor.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

final class ContactFormInteractor: ContactFormInteractorProtocol {
    
    //MARK: - Vars
    let dataWorker: ContactFormDataWorkerProtocol
    var presenter: ContactFormPresenterProtocol
    
    required init(presenter: ContactFormPresenterProtocol, dataWorker: ContactFormDataWorkerProtocol) {
        self.presenter = presenter
        self.dataWorker = dataWorker
    }
    
    // MARK: - Protocol Methods
    func validateField(type: ContactFormFieldType, value: String?) {
        presenter.fieldStatus(dataWorker.validateField(type: type, value: value), type: type)
    }

    func saveFormData(_ model: ContactFormFieldModel) {
        if dataWorker.saveFormData(model) {
            presenter.formDataSaved()
        }
    }
}
