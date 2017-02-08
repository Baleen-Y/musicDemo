//
//  UIBarButtonItemExtension.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*

 UIBarButtonItem 类拓展
 */

import UIKit

// MARK: - 拓展方法
extension UIBarButtonItem {
    
    /// 高亮按钮设置
    ///
    /// - Parameters:
    ///   - image: 普通图片
    ///   - highlightImage: 高亮图片
    ///   - target: 按钮事件处理者
    ///   - action: 按钮的方法
    /// - Returns: 包装后的按钮
    static func highlightItem(_ image: UIImage, _ highlightImage: UIImage?, _ target: Any?, action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        let buttonView = setupButton(image, highlightImage, nil, target, action, button)
        return UIBarButtonItem(customView: buttonView)
        
    }
    
    /// 选中按钮设置
    static func selectedItem(_ image: UIImage, _ selectedImage: UIImage?, _ target: Any?, action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        let buttonView = setupButton(image, nil, selectedImage, target, action, button)
        return UIBarButtonItem(customView: buttonView)
    }
    
    /// 返回按钮设置
    ///
    /// - Parameters:
    ///   - title: 返回按钮文字
    ///   - badgeValue: 返回按钮上的提醒数字
    static func backItem(_ title: String?, badgeValue: String?, _ target: Any?, action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        // 拼接返回标题
        if let badgeValue = badgeValue {
            let titleNew = title?.appending("(\(badgeValue))")
            button.setTitle(titleNew, for: .normal)
        } else {
            button.setTitle(title, for: .normal)
        }
        
        button.setTitleColor(BYNormalColor, for: .normal)
        button.setTitleColor(BYSelectedColor, for: .highlighted)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0)
        let image = #imageLiteral(resourceName: "navigationBar-back")
        let highImage = #imageLiteral(resourceName: "navigationBar-backHighlight")
        let buttonView = setupButton(image, highImage, nil, target, action, button)
        return UIBarButtonItem(customView: buttonView)
    }
    
}

// MARK: - 私有方法
extension UIBarButtonItem {
    fileprivate static func setupButton(_ image: UIImage, _ highlightImage: UIImage?, _ selectedImage: UIImage?, _ target: Any?, _ action: Selector, _ button: UIButton) -> UIView {
        
        button.setImage(image, for: .normal)
        button.setImage(highlightImage, for: .highlighted)
        button.setImage(selectedImage, for: .selected)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.sizeToFit()
        let contentView = UIView(frame: button.bounds)
        contentView.addSubview(button)
        return contentView
    }
}
