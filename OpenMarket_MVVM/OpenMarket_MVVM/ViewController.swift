//
//  ViewController.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/11.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        viewModel.input.onViewDidLoad.accept(())
    }
    
    private func bind() {
        viewModel.output.backgroundColorObservable
            .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] color in
                guard let self = self else { return }
                print("2")
                self.view.backgroundColor = color
            }).disposed(by: bag)
        
        print("1")

    }


}

