//
//  SearchDetailViewController.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

class SearchDetailViewController: BaseViewController {
    
    var app: Result!
    
    let scrollView = UIScrollView()
    let contentView = BaseView()
    let appMainView = AppMainView()
    let appVersionView = AppVersionView()
    let appPreviewView = AppPreviewView()
    let appDescriptionView = AppDescriptionView()
    
    let disposeBag = DisposeBag()
    
    let viewModel = SearchDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(appMainView)
        contentView.addSubview(appVersionView)
        contentView.addSubview(appPreviewView)
        contentView.addSubview(appDescriptionView)
    }
    
    override func configureView() {
        let imageURL = URL(string: app.artworkUrl512)
        appMainView.appImageView.kf.setImage(with: imageURL)
        appMainView.appNameLabel.text = app.trackCensoredName
        appMainView.appCategoryLabel.text = app.primaryGenreName

        appVersionView.versionLabel.text = "Version \(app.version)"
        appVersionView.versionDescriptionLabel.text = app.releaseNotes
        
        let screenshotUrls = BehaviorSubject(value: app.screenshotUrls)
        let input = SearchDetailViewModel.Input(screenshotUrls: screenshotUrls)
        let output = viewModel.transform(input: input)
        output.screenshotUrls.bind(to: appPreviewView.collectionView.rx.items(cellIdentifier: AppPreviewCollectionViewCell.identifier, cellType: AppPreviewCollectionViewCell.self)) { (row, element, cell) in
            let imageURL = URL(string: self.app.screenshotUrls[row])
            cell.screenshotImageView.kf.setImage(with: imageURL)
        }.disposed(by: disposeBag)
        
        appDescriptionView.descriptionLabel.text = app.description
    }
    
    override func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
             make.edges.equalTo(scrollView.contentLayoutGuide)
             make.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        appMainView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.horizontalEdges.equalTo(contentView)
        }
        
        appVersionView.snp.makeConstraints { make in
            make.top.equalTo(appMainView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView)
        }
        
        appPreviewView.snp.makeConstraints { make in
            make.top.equalTo(appVersionView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView)
        }
        
        appDescriptionView.snp.makeConstraints { make in
            make.top.equalTo(appPreviewView.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalTo(contentView)
        }
    }
}
