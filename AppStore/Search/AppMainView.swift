//
//  AppMainView.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit

class AppMainView: BaseView {
    let appImageView = UIImageView()
    let nameStackView = UIStackView()
    let appNameLabel = UILabel()
    let appCategoryLabel = UILabel()
    let getButton = UIButton()
    let shareButton = UIButton()
    
    override func configureHierarchy() {
        addSubview(appImageView)
        addSubview(nameStackView)
        nameStackView.addArrangedSubview(appNameLabel)
        nameStackView.addArrangedSubview(appCategoryLabel)
        addSubview(getButton)
        addSubview(shareButton)
    }
    
    override func configureView() {
        appImageView.backgroundColor = .yellow
        appImageView.contentMode = .scaleAspectFit
        appImageView.clipsToBounds = true
        appImageView.layer.cornerRadius = 20
        appImageView.layer.borderWidth = 1
        appImageView.layer.borderColor = UIColor.systemGray6.cgColor
        
        nameStackView.axis = .vertical
        nameStackView.distribution = .fillEqually
        nameStackView.alignment = .leading
        nameStackView.spacing = 5
        
        appNameLabel.font = .systemFont(ofSize: 16)
        appCategoryLabel.font = .systemFont(ofSize: 15)
        appCategoryLabel.textColor = .systemGray
        
        getButton.configuration = .get(title: "get", foregroundColor: .white, backgroundColor: .systemBlue)
        
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
    }
    
    override func configureConstraints() {
        appImageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.size.equalTo(100)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.top)
            make.leading.equalTo(appImageView.snp.trailing).offset(10)
        }
        
        getButton.snp.makeConstraints { make in
            make.bottom.equalTo(appImageView.snp.bottom)
            make.leading.equalTo(appImageView.snp.trailing).offset(10)
            make.width.equalTo(75)
            make.height.equalTo(35)
        }
        
        shareButton.snp.makeConstraints { make in
            make.bottom.equalTo(getButton.snp.bottom)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.size.equalTo(40)
        }
    }
}
