//
//  MapListRestWorkerProtocol.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation

protocol MapListRestWorkerProtocol: class {
    func fetch(completion: @escaping RestResponse<[RouteRestModel]>)
}
