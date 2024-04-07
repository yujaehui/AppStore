//
//  AppVersionView.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit

class AppVersionView: BaseView {
    let newLabel = UILabel()
    let versionLabel = UILabel()
    let versionDescriptionLabel = UILabel()
    
    override func configureHierarchy() {
        addSubview(newLabel)
        addSubview(versionLabel)
        addSubview(versionDescriptionLabel)
    }
    
    override func configureView() {
        newLabel.text = "What's New"
        newLabel.font = .boldSystemFont(ofSize: 18)
        versionLabel.font = .systemFont(ofSize: 12, weight: .light)
        versionLabel.textColor = .systemGray
        versionDescriptionLabel.font = .systemFont(ofSize: 12, weight: .light)
        versionDescriptionLabel.numberOfLines = 0
    }
    
    override func configureConstraints() {
        newLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(5)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(newLabel.snp.bottom).offset(5)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        versionDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(versionLabel.snp.bottom).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
        }
    }
}
