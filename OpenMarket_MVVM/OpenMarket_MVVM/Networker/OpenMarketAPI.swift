//
//  OpenMarketAPI.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/22.
//

import Foundation
import Alamofire

enum OpenMarketAPI {
    static let baseURL = "https://camp-open-market-2.herokuapp.com/"
    
    case getItemCollection(page: Int)
    case getItem(id: Int)
    case deleteItem(id: Int)
    case patchItem(id: Int)
    case postItem
    
    var requestForm: (url: String, method: HTTPMethod) {
        switch self {
        case .getItemCollection(let page):
            return (url: OpenMarketAPI.baseURL + "items/\(page)", method: .get)
        case .getItem(let id):
            return (url: OpenMarketAPI.baseURL + "item/\(id)", method: .get)
        case .deleteItem(let id):
            return (url: OpenMarketAPI.baseURL + "item/\(id)", method: .delete)
        case .patchItem(let id):
            return (url: OpenMarketAPI.baseURL + "item/\(id)", method: .patch)
        case .postItem:
            return (url: OpenMarketAPI.baseURL + "item", method: .post)
        }
    }
}
