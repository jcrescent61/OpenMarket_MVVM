//
//  UIView+.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
