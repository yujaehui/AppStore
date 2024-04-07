//
//  SearchViewController.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

class SearchViewController: BaseViewController {
    
    let tableView = UITableView()
    
    var disposeBag = DisposeBag()
    
    let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
        bind()
    }
    
    func bind() {
        guard let searchBar = navigationItem.searchController?.searchBar else { return }
        let search = searchBar.rx.searchButtonClicked
        let searchText = searchBar.rx.text.orEmpty
        let searchCancel = searchBar.rx.cancelButtonClicked
        let input = SearchViewModel.Input(search: search, searchText: searchText, searchCancel: searchCancel)
        
        let output = viewModel.transform(input: input)
        output.appList.bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { (row, element, cell) in
            let imageURL = URL(string: element.artworkUrl512)
            cell.appImageView.kf.setImage(with: imageURL)
            cell.appNameLabel.text = element.trackCensoredName
            cell.appCategoryLabel.text = element.primaryGenreName
            cell.ratingCountLabel.text = "\(element.averageUserRating)"
            cell.developerLabel.text = element.artistName
            cell.categoryLabel.text = element.primaryGenreName
        }.disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(Result.self)).subscribe(with: self) { owner, value in
            let vc = SearchDetailViewController()
            vc.app = value.1
            owner.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: disposeBag)
    }
    
    override func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    override func configureView() {
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setNav() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.title = "Search"
    }
}
