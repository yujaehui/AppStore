//
//  BaseViewController.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureView()
        configureConstraints()
    }
    
    func configureHierarchy() {}
    func configureView() {}
    func configureConstraints() {}
}
