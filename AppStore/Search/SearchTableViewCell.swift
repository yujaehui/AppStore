//
//  SearchTableViewCell.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit

class SearchTableViewCell: BaseTableViewCell {
    
    let appImageView = UIImageView()
    let nameStackView = UIStackView()
    let appNameLabel = UILabel()
    let appCategoryLabel = UILabel()
    let getButton = UIButton()
    let starImageView = UIImageView()
    let ratingCountLabel = UILabel()
    let developerLabel = UILabel()
    let categoryLabel = UILabel()
    
    override func configureHierarchy() {
        contentView.addSubview(appImageView)
        contentView.addSubview(nameStackView)
        nameStackView.addArrangedSubview(appNameLabel)
        nameStackView.addArrangedSubview(appCategoryLabel)
        contentView.addSubview(getButton)
        contentView.addSubview(starImageView)
        contentView.addSubview(ratingCountLabel)
        contentView.addSubview(developerLabel)
        contentView.addSubview(categoryLabel)
    }
    
    override func configureView() {
        appImageView.contentMode = .scaleAspectFit
        appImageView.clipsToBounds = true
        appImageView.layer.cornerRadius = 12
        appImageView.layer.borderWidth = 1
        appImageView.layer.borderColor = UIColor.systemGray6.cgColor
        
        nameStackView.axis = .vertical
        nameStackView.distribution = .fillEqually
        nameStackView.alignment = .leading
        nameStackView.spacing = 5
        
        appNameLabel.font = .systemFont(ofSize: 15)
        appCategoryLabel.font = .systemFont(ofSize: 13)
        appCategoryLabel.textColor = .systemGray
        
        getButton.configuration = .get(title: "get", foregroundColor: .systemBlue, backgroundColor: .systemGray6)
        
        starImageView.image = UIImage(systemName: "star.fill")
        ratingCountLabel.font = .boldSystemFont(ofSize: 12)
        ratingCountLabel.textColor = .systemGray
        developerLabel.font = .boldSystemFont(ofSize: 12)
        developerLabel.textColor = .systemGray
        developerLabel.textAlignment = .center
        categoryLabel.font = .boldSystemFont(ofSize: 12)
        categoryLabel.textColor = .systemGray
        categoryLabel.textAlignment = .right

    }
    
    override func configureConstraints() {
        
        appImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView).inset(20)
            make.size.equalTo(60)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.centerY.equalTo(appImageView.snp.centerY)
            make.leading.equalTo(appImageView.snp.trailing).offset(10)
            make.trailing.equalTo(getButton.snp.leading).offset(-20)
        }
        
        getButton.snp.makeConstraints { make in
            make.centerY.equalTo(appImageView.snp.centerY)
            make.trailing.equalTo(contentView).inset(20)
            make.width.equalTo(70)
            make.height.equalTo(35)
        }
        
        starImageView.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.bottom).offset(10)
            make.leading.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(10)
        }
        
        ratingCountLabel.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.bottom).offset(10)
            make.leading.equalTo(starImageView.snp.trailing).offset(5)
            make.bottom.equalTo(contentView).inset(10)
        }
        
        developerLabel.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.bottom).offset(10)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView).inset(10)
            make.width.equalTo(120)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.bottom).offset(10)
            make.trailing.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(10)
        }
        
        
    }
}
