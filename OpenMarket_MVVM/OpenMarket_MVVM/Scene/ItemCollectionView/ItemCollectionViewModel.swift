//
//  ItemCollectionViewModel.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/20.
//

import Foundation
import RxSwift
import RxRelay
import RxDataSources

class ItemCollectionViewModel {
    
    private var item: [Item] = []
    private let networkHandler = NetworkHandler()
    private let disposeBag = DisposeBag()

    func request() {
        networkHandler.request(api: .getItemCollection(page: 1)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let model = try? JSONHandler().decodeJSONData(json: data, model: ItemCollection.self) else { return }
                self.item.append(contentsOf: model.items)
            default:
                break
            }
        }
    }
}
