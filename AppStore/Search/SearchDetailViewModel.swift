//
//  SearchDetailViewModel.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchDetailViewModel {
    struct Input {
        let screenshotUrls: BehaviorSubject<[String]>
    }
    
    struct Output {
        let screenshotUrls: BehaviorSubject<[String]>
    }
    
    func transform(input: Input) -> Output {
        return Output(screenshotUrls: input.screenshotUrls)
    }
}
