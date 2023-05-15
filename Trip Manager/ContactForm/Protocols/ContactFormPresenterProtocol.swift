//
//  ContactFormPresenterProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import Foundation

protocol ContactFormPresenterProtocol {
    func fieldStatus(_ value: Bool, type: ContactFormFieldType)
    func formDataSaved()
}
