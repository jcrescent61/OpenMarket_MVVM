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

protocol ItemCollectionInputInterface {
    var onViewDidLoad: PublishRelay<Void> { get }
}
protocol ItemCollectionOutputInterface {
    var sectionsRelay: Observable<[SectionModel<ItemSection, Item>]> { get }
}

protocol ItemCollectionInterfaceable: ItemCollectionInputInterface {
    var input: ItemCollectionInputInterface { get }
    var output: ItemCollectionOutputInterface { get }
}

enum ItemSection {
    case itemCollection
}

class ItemCollectionViewModel: ItemCollectionInterfaceable, ItemCollectionInputInterface, ItemCollectionOutputInterface {
    
    private var item: [ItemCollection] = []
    private let networkHandler = NetworkHandler()
    private let disposeBag = DisposeBag()
    
    // MARK: -  ItemCollectionInterfaceable Properties
    var input: ItemCollectionInputInterface { return self }
    var output: ItemCollectionOutputInterface { return self }
    
    var onViewDidLoad: PublishRelay<Void> = .init()
    
    // MARK: - OutputProperties
    var sectionsRelay: Observable<[SectionModel<ItemSection, Item>]> {
        return sectionSubject.asObservable()
    }
    
    // MARK: - Private OutputProperties
    private let sectionSubject: PublishSubject<[SectionModel<ItemSection, Item>]> = .init()
    
    init() {
        bind()
    }
    
    private func bind() {
        input.onViewDidLoad
            .map { _ -> [SectionModel<ItemSection, Item>] in
                return [.init(model: .itemCollection, items: [.init(
                    id: 0,
                    title: "qweqwe",
                    price: 1000,
                    currency: "dsasdfsadf",
                    stock: 100,
                    discountedPrice: 100,
                    thumbnails: ["asdfzcxvxcv"],
                    registrationDate: 1000)]
                )]
            }.bind(to: sectionSubject)
            .disposed(by: disposeBag)
    }
    
//    func request() {
//        networkHandler.request(api: .getItemCollection(page: 1)) { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let data):
//                guard let model = try? JSONHandler().decodeJSONData(json: data, model: ItemCollection.self) else { return }
//                self.item.append(contentsOf: model.items)
//            default:
//                break
//            }
//        }
//    }
}
