//
//  AppDescriptionView.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit

class AppDescriptionView: BaseView {
    let descriptionLabel = UILabel()
    let moreButton = UIButton()
    
    override func configureHierarchy() {
        addSubview(descriptionLabel)
        addSubview(moreButton)
    }
    
    override func configureView() {
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 3
        
        moreButton.configuration = .more()
        moreButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
    }
    
    @objc func moreButtonClicked() {
        descriptionLabel.numberOfLines = 0
        moreButton.isHidden = true
    }
    
    override func configureConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(5)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
        }
        
        moreButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(descriptionLabel.snp.bottom)
        }
    }
}
