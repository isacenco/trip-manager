//
//  TripListRestWorkerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

protocol TripListRestWorkerProtocol: class {
    func fetch(completion: @escaping RestResponse<[TripRestModel]>)
}
