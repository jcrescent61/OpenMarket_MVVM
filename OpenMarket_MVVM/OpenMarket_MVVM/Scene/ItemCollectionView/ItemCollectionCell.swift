//
//  ItemCollectionCell.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/20.
//

import UIKit

class ItemCollectionCell: UICollectionViewCell {
    static let id: String = "\(ItemCollectionCell.self)"
    
    private lazy var thumbnailImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "questionmark.square.fill"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .gray
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.preferredFont(forTextStyle: .body)
       return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private lazy var stockLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
}

extension ItemCollectionCell {
    func setUpLabel(item: Item) {
        titleLabel.text = item.title
        currencyLabel.text = item.currency
        priceLabel.text = "\(item.price)"
        stockLabel.text = "\(item.stock)"
    }
    
    private func setUpUI() {
        backgroundColor = .white
        self.layer.cornerRadius = 20
        
        addSubviews(thumbnailImage, titleLabel, currencyLabel, priceLabel, stockLabel)
        
        // MARK: - thumbnailImage
        NSLayoutConstraint.activate([
            thumbnailImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            thumbnailImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            thumbnailImage.widthAnchor.constraint(equalTo: thumbnailImage.heightAnchor),
            thumbnailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        ])
        
        // MARK: - titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: 10),
        ])
        
        // MARK: - currncyLabel
        NSLayoutConstraint.activate([
            currencyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            currencyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])
        
        // MARK: - priceLabel
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: 3),
            priceLabel.topAnchor.constraint(equalTo: currencyLabel.topAnchor)
        ])
        
        // MARK: - stockLabel
        NSLayoutConstraint.activate([
            stockLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            stockLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
