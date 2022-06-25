//
//  ItemCollectionViewController.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/20.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import RxDataSources

enum ItemCollectionViewConstraint {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    static let minimumLineSpacing: CGFloat = 15
    static let minimumInteritemSpacing: CGFloat = 10
    static let inset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    static let numberOfCells: CGFloat = 8
}

class ItemCollectionViewController: UIViewController, UIScrollViewDelegate {
    private let viewModel = ItemCollectionViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = configureFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        bind()
        
        viewModel.input.onViewDidLoad.accept(())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
    }
    
    private func bind() {
        
        collectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        viewModel.output.sectionsRelay
            .bind(to: collectionView.rx.items(dataSource: createDatasource()))
            .disposed(by: disposeBag)
        
    }
    
    private func setUp() {
        collectionView.register(ItemCollectionCell.self, forCellWithReuseIdentifier: ItemCollectionCell.id)
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        navigationItem.title = "OpenMarket"
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = ItemCollectionViewConstraint.inset
        flowLayout.minimumLineSpacing = ItemCollectionViewConstraint.minimumLineSpacing
        flowLayout.minimumInteritemSpacing = ItemCollectionViewConstraint.minimumInteritemSpacing
        flowLayout.itemSize.width = ItemCollectionViewConstraint.deviceWidth - ItemCollectionViewConstraint.inset.left - ItemCollectionViewConstraint.inset.right
        flowLayout.itemSize.height = (ItemCollectionViewConstraint.deviceHeight - ItemCollectionViewConstraint.inset.top - ItemCollectionViewConstraint.inset.bottom) / ItemCollectionViewConstraint.numberOfCells
        return flowLayout
    }
    
    private func createDatasource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<ItemSection, Item>> {
        return .init { datasource, collectionView, indexPath, item in
            let section = datasource.sectionModels[indexPath.section].identity
            
            switch section {
            case .itemCollection:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.id, for: indexPath) as? ItemCollectionCell else {
                    return UICollectionViewCell()
                }
                
                cell.setUpLabel(item: item)
                
                return cell
            }
        }
    }
}
