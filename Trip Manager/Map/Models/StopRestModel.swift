//
//  StopRestModel.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 14/5/23.
//

import Foundation

    // MARK: - Welcome
struct StopRest: Codable {
    let price: Double?
    let address: String?
    let tripID: Int?
    let paid: Bool?
    let stopTime: String?
    let point: CoordsRestModel?
    let userName: String?
    
    enum CodingKeys: String, CodingKey {
        case price, address
        case tripID = "tripId"
        case paid, stopTime, point, userName
    }
}
