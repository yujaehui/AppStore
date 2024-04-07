//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    
    let disposeBag = DisposeBag()
    
    var appList = BehaviorSubject<[Result]>(value: [])
    
    struct Input {
        let search: ControlEvent<Void>
        let searchText: ControlProperty<String>
        let searchCancel: ControlEvent<Void>
    }
    
    struct Output {
        let appList: BehaviorSubject<[Result]>
    }
    
    func transform(input: Input) -> Output {
        input.search
            .withLatestFrom(input.searchText)
            .flatMap { AppAPIService.fetchAppData(term: $0) }
            .debug()
            .subscribe(with: self, onNext: { owner, value in
                print("Transform Next")
                let data = value.results
                owner.appList.onNext(data)
            }, onError: { _, _ in
                print("Transform Error")
            }, onCompleted: { _ in
                print("Transform Completed")
            }, onDisposed: { _ in
                print("Transform Disposed")
            })
            .disposed(by: disposeBag)
        
        
        input.searchCancel
            .subscribe(with: self) { owner, _ in
                owner.appList.onNext([])
            }.disposed(by: disposeBag)
        
        return Output(appList: appList)
    }
}
