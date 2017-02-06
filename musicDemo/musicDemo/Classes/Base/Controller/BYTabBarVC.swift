//
//  BYTabBarVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 基础 tabBarController
 */

import UIKit

class BYTabBarVC: UITabBarController {

    // MARK: - 重写系统方法
    override class func initialize() {
        super.initialize()
        setupTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildVC()
    }
    
}

// MARK: - 自定义方法
extension BYTabBarVC {
    
    /// 配置 tabBar
    fileprivate class func setupTabBar() {
        /// 修改 tabBarItem 样式
        var tabBarItem: UITabBarItem
        if #available(iOS 9.0, *) {
            tabBarItem = UITabBarItem.appearance(whenContainedInInstancesOf: [BYTabBarVC.self])
        } else {
            // Fallback on earlier versions
            tabBarItem = UITabBarItem.appearance()
        }
        let attNormal = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 10),
            NSForegroundColorAttributeName: BYNormalColor
        ]
        tabBarItem.setTitleTextAttributes(attNormal, for: .normal)
        let attSelected = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 10),
            NSForegroundColorAttributeName: BYSelectedColor
        ]
        tabBarItem.setTitleTextAttributes(attSelected, for: .selected)
        
        /// 修改 tabBar 样式
        var tabBar: UITabBar
        if #available(iOS 9.0, *) {
            tabBar = UITabBar.appearance(whenContainedInInstancesOf: [BYTabBarVC.self])
        } else {
            // Fallback on earlier versions
            tabBar = UITabBar.appearance()
        }
        tabBar.backgroundImage = #imageLiteral(resourceName: "tabBar-background")
    }
    
    /// 配置子控制器
    fileprivate func setupChildVC() {
        let childVCArr = BYChildVCItem.getChildVCArr()
        for childVC in childVCArr {
            addChildViewController(childVC)
        }
    }
    
}
