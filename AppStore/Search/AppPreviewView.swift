//
//  AppPreviewView.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class AppPreviewView: BaseView {
    let previewLabel = UILabel()
    
    lazy var collectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return AppPreviewSection().layoutSection()
        }
        return layout
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    
    override func configureHierarchy() {
        addSubview(previewLabel)
        addSubview(collectionView)
    }
    
    override func configureView() {
        previewLabel.text = "Preview"
        previewLabel.font = .boldSystemFont(ofSize: 18)
        
        collectionView.register(AppPreviewCollectionViewCell.self, forCellWithReuseIdentifier: AppPreviewCollectionViewCell.identifier)
    }
    
    override func configureConstraints() {
        previewLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(5)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(previewLabel.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
            make.height.equalTo(400)
        }
    }
}
