//
//  ContactFormViewControllerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

protocol ContactFormViewControllerProtocol {
    func showCorrectField(_ type: ContactFormFieldType)
    func showErrorField(_ type: ContactFormFieldType)
    func showSuccessPopup()
}
