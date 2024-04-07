//
//  ViewController.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addVC()
    }

    private func addVC() {
        let todayVC = UINavigationController(rootViewController: TodayViewController())
        todayVC.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "doc.text.image"), selectedImage: UIImage(systemName: "doc.text.image"))
        
        let gameVC = UINavigationController(rootViewController: GameViewController())
        gameVC.tabBarItem = UITabBarItem(title: "Games", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller"))
        
        let appVC = UINavigationController(rootViewController: AppViewController())
        appVC.tabBarItem = UITabBarItem(title: "Apps", image: UIImage(systemName: "square.stack.3d.up.fill"), selectedImage: UIImage(systemName: "square.stack.3d.up.fill"))
        
        let arcadeVC = UINavigationController(rootViewController: ArcadeViewController())
        arcadeVC.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(systemName: "arcade.stick"), selectedImage: UIImage(systemName: "arcade.stick"))
        
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        self.viewControllers = [todayVC, gameVC, appVC, arcadeVC, searchVC]
    }
}

