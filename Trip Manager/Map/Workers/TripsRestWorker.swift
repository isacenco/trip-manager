//
//  TripsRestWorker.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import Foundation
import Alamofire
 
final class TripsRestWorker: TripListRestWorkerProtocol {
    func fetch(completion: @escaping RestResponse<[TripRestModel]>) {
        AF.request("https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/trips.json").responseData { response in
            switch response.result {
            case .success(let result):
                guard let listModel = try? JSONDecoder().decode([TripRestModel].self, from: result) else {
                    completion(.error(NSError.init(domain: "MAP", code: -1, userInfo: nil)))
                    return
                }
                
                completion(.success(listModel))
                
                break
            case .failure(let error):
                let err = error as NSError
                completion(.error(err))
                break
            }
        }
    }
}
