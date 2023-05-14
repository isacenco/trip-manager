//
//  StopRestWorker.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 14/5/23.
//

import Foundation
import Alamofire

final class StopRestWorker: StopRestWorkerProtocol {
    func fetch(completion: @escaping RestResponse<StopRest>) {
        AF.request("https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/stops.json").responseData { response in
            switch response.result {
            case .success(let result):
                guard let stop = try? JSONDecoder().decode(StopRest.self, from: result) else {
                    completion(.error(NSError.init(domain: "MAP", code: -1, userInfo: nil)))
                    return
                }
                
                completion(.success(stop))
                
                break
            case .failure(let error):
                let err = error as NSError
                completion(.error(err))
                break
            }
        }
    }
}
