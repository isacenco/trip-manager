//
//  ContactFormDataWorker.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

final class ContactFormDataWorker: ContactFormDataWorkerProtocol {
    func validateField(type: ContactFormFieldType, value: String?) -> Bool {
        switch type {
        case .name:
            return validateNameSurname(value)
        case .surname:
            return validateNameSurname(value)
        case .email:
            return validateEmail(value)
        case .phone:
            return validatePhone(value)
        case .description:
            return validateDescription(value)
        }
    }
    
    func saveFormData(_ model: ContactFormFieldModel) -> Bool {
        if validateNameSurname(model.name) &&
            validateNameSurname(model.surname) &&
            validateEmail(model.email) &&
            validatePhone(model.phone) &&
            validateDescription(model.description) {
            
            
            return true
        }
    }
    
    func validateNameSurname(_ value: String?) -> Bool {
        if let val = value, !val.isEmpty { return true }
        else { return false }
    }
    
    func validateEmail(_ value: String?) -> Bool {
        guard let email = value else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func validatePhone(_ value: String?) -> Bool {
        guard let phone = value else { return false }
        
        if phone.isEmpty { return true }
        
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: phone)
        return result
    }
    
    func validateDescription(_ value: String?) -> Bool {
        if let val = value, !val.isEmpty, val.count <= 200 { return true }
        else { return false }
    }
}
