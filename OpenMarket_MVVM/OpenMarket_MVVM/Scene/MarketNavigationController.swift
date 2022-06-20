//
//  MarketNavigationController.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/20.
//

import UIKit

class MarketNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .light)
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.gray]
        self.navigationBar.standardAppearance = appearance
    }
}
