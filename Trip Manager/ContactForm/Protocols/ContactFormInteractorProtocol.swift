//
//  ContactFormInteractorProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

protocol ContactFormInteractorProtocol {
    func validateField(type: ContactFormFieldType, value: String?)
    func saveFormData(_ model: ContactFormFieldModel)
}
