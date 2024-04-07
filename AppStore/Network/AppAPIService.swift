//
//  AppAPIService.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
    case failDecoding
}

class AppAPIService {
    
    static func fetchAppData(term: String) -> Observable<AppModel> {
        return Observable<AppModel>.create { observer in
            
            guard let url = AppAPI.app(term: term).endpoint else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let _ = error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data = data,
                    let appData = try? JSONDecoder().decode(AppModel.self, from: data) {
                    observer.onNext(appData)
                    observer.onCompleted()
                } else {
                    observer.onError(APIError.failDecoding)
                }
            }.resume()
            
            return Disposables.create()
            
        }.debug()
    }
}
