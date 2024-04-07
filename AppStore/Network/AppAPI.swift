//
//  AppAPI.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import Foundation

enum AppAPI {
    case app(term: String)
    
    var baseURL: String {
        switch self {
        case .app(let term):
            return "https://itunes.apple.com/search?term=\(term)&country=KR&entity=software"
        }
    }
    
    var endpoint: URL? {
        return URL(string: baseURL)
    }
}
