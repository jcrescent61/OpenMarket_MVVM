//
//  Item.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/20.
//

import Foundation

class ItemCollection: Codable {
    let page: Int
    let items: [Item]
}

class Item: Codable {
    let id: Int
    let title: String
    let price: Int
    let currency: String
    let stock: Int
    let discountedPrice: Int?
    let thumbnails: [String]
    let registrationDate: Double
}

class ItemInfo: Item {
    let descriptions: String? = nil
    let images: [String]? = nil
}
