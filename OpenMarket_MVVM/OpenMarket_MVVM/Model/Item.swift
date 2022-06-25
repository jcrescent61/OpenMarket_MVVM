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
    
    init(page: Int, items: [Item]) {
        self.page = page
        self.items = items
    }
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
    
    init(id: Int, title: String, price: Int, currency: String, stock: Int, discountedPrice: Int?, thumbnails: [String], registrationDate: Double) {
        self.id = id
        self.title = title
        self.price = price
        self.currency = currency
        self.stock = stock
        self.discountedPrice = discountedPrice
        self.thumbnails = thumbnails
        self.registrationDate = registrationDate
    }
}

class ItemInfo: Item {
    let descriptions: String? = nil
    let images: [String]? = nil
}
