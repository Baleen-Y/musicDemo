//
//  BYNavigationVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 基础 navigationController
 */

import UIKit

class BYNavigationVC: UINavigationController {

    // MARK: - 重写系统方法
    override class func initialize() {
        super.initialize()
        setupNavigationBar()
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        /// 跳转之前设置左侧的返回按钮
        if childViewControllers.count > 0 {
            /// 设置返回按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.backItem(topViewController?.title, badgeValue: tabBarItem.badgeValue, self, action: #selector(back))
        }
        super.pushViewController(viewController, animated: animated)
    }

}


// MARK: - 自定义方法
extension BYNavigationVC {
    
    fileprivate static func setupNavigationBar() {
        /// 修改 navigationBar 样式
        var navigationBar: UINavigationBar
        if #available(iOS 9.0, *) {
            navigationBar = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        } else {
            // Fallback on earlier versions
            navigationBar = UINavigationBar.appearance()
        }
        let att = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18),
            NSForegroundColorAttributeName: BYNormalColor
        ]
        navigationBar.titleTextAttributes = att
        navigationBar.setBackgroundImage(#imageLiteral(resourceName: "navigationBar-background"), for: .default)
    }
    
    @objc fileprivate func back() {
        popViewController(animated: true)
    }
}
