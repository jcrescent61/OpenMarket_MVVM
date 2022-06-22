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

enum ItemCollectionViewConstraint {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    static let minimumLineSpacing: CGFloat = 15
    static let minimumInteritemSpacing: CGFloat = 10
    static let inset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    static let numberOfCells: CGFloat = 8
}

class ItemCollectionViewController: UICollectionViewController {
    private let viewModel = ItemCollectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.request()
        setUp()
    }
    
    private func setUp() {
        collectionView.collectionViewLayout = configureFlowLayout()
        collectionView.dataSource = self
        collectionView.register(ItemCollectionCell.self, forCellWithReuseIdentifier: ItemCollectionCell.id)
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        navigationItem.title = "OpenMarket"
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
}

extension ItemCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.id,
                                                            for: indexPath) as? ItemCollectionCell else { return UICollectionViewCell() }
        cell.setUpLabel()
        return cell
    }
}
