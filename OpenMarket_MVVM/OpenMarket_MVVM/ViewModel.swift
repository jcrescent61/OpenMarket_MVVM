//
//  ViewModel.swift
//  OpenMarket_MVVM
//
//  Created by Ellen on 2022/06/11.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

protocol ViewModelInputInterface {
    var onViewDidLoad: PublishRelay<Void> { get }
}

protocol ViewModelOutputInterface {
    var  backgroundColorObservable: Observable<UIColor> { get }
}

protocol ViewModelInterfaceable {
    var input: ViewModelInputInterface { get }
    var output: ViewModelOutputInterface { get }
}

class ViewModel: ViewModelInterfaceable, ViewModelInputInterface, ViewModelOutputInterface {
    
    var input: ViewModelInputInterface { return self }
    var output: ViewModelOutputInterface { return self }
    
    private let bag = DisposeBag()
    
    // MARK: - InputInterface Properties
    var onViewDidLoad: PublishRelay<Void> = .init()
    
    // MARK: - OutputInterface Properties
    private let backgroundColorSubject = PublishRelay<UIColor>()
    var backgroundColorObservable: Observable<UIColor> {
        return backgroundColorSubject.asObservable()
    }
    
    init() {
        bind()
    }
    
    private func bind() {
        
        input.onViewDidLoad
            .subscribe { [weak self] _ in
                guard let self = self else { return }
                self.backgroundColorSubject.accept(.red)
                print("4")
            }.disposed(by: bag)
        
        print("3")

        
    }
    
}
