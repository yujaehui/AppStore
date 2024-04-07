//
//  AppModel.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import Foundation

struct AppModel: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let trackCensoredName: String // 앱 이름
    let formattedPrice: String // 가격
    let screenshotUrls: [String] // 스크린샷
    let artworkUrl512: String // 이미지
    let userRatingCountForCurrentVersion: Int // 별점 갯수
    let averageUserRating: Double // 별점 평균
    let contentAdvisoryRating: String // 나이 제한
    let primaryGenreName: String // 카테고리
    let artistName: String // 개발자 이름
    let languageCodesISO2A: [String] // 언어
    let fileSizeBytes: String // 파일 사이즈
    let version: String // 버전
    let releaseNotes: String // 버전 기록
    let currentVersionReleaseDate: String // 버전 업데이트 날짜
    let description: String // 설명
}
