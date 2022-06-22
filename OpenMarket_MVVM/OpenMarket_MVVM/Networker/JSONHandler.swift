//
//  JSONHandler.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/22.
//

import Foundation

enum DecodeError: Error {
    case decodeError
    case notFound
}

class JSONHandler {
    func decodeJSONData<T: Decodable>(json: Data?, model: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = json else { throw DecodeError.notFound }
        do {
            return try decoder.decode(model, from: data)
        } catch {
            throw DecodeError.decodeError
        }
    }
}
