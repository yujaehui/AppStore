//
//  AppPreviewCollectionViewCell.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit

class AppPreviewCollectionViewCell: BaseCollectionViewCell {
    let screenshotImageView = UIImageView()
    
    override func configureHierarchy() {
        contentView.addSubview(screenshotImageView)
    }
    
    override func configureView() {
        screenshotImageView.backgroundColor = .green
        screenshotImageView.contentMode = .scaleAspectFit
        screenshotImageView.clipsToBounds = true
        screenshotImageView.layer.cornerRadius = 20
        screenshotImageView.layer.borderWidth = 1
        screenshotImageView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    override func configureConstraints() {
        screenshotImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
}
