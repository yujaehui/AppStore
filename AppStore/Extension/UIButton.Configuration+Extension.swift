//
//  UIButton.Configuration+Extension.swift
//  AppStore
//
//  Created by Jaehui Yu on 4/7/24.
//

import UIKit

extension UIButton.Configuration {
    static func get(title: String, foregroundColor: UIColor, backgroundColor: UIColor) -> Self {
        var config = UIButton.Configuration.filled()
        
        var titleAttr = AttributedString.init(title)
        titleAttr.font = .boldSystemFont(ofSize: 15)
        config.attributedTitle = titleAttr
        config.titleAlignment = .center
        
        config.baseForegroundColor = foregroundColor
        config.baseBackgroundColor = backgroundColor
        config.cornerStyle = .capsule
        return config
    }
    
    static func more() -> Self {
        var config = UIButton.Configuration.filled()
        
        var titleAttr = AttributedString.init("more")
        titleAttr.font = .systemFont(ofSize: 15)
        config.attributedTitle = titleAttr
        config.titleAlignment = .trailing
        config.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        config.baseForegroundColor = .systemBlue
        config.baseBackgroundColor = .white
        return config
    }
}
