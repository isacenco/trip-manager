//
//  ContactFormDataWorkerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

protocol ContactFormDataWorkerProtocol {
    func validateField(type: ContactFormFieldType, value: String?) -> Bool
    func saveFormData(_ model: ContactFormFieldModel) -> Bool
}
