//
//  NetworkHandler.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/22.
//

import Foundation
import Alamofire

class NetworkHandler {
    func request(api: OpenMarketAPI, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        let url = api.requestForm.url
        let httpMethod = api.requestForm.method
        
        AF.request(url, method: httpMethod, parameters: nil)
            .responseData { response in
                switch response.result {
                case let .success(data):
                    completionHandler(.success(data))
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            }
    }
}
