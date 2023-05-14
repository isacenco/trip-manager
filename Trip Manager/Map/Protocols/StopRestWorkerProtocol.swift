//
//  StopRestWorkerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 14/5/23.
//

import Foundation

protocol StopRestWorkerProtocol: class {
    func fetch(completion: @escaping RestResponse<StopRest>)
}
