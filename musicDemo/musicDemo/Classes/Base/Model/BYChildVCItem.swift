//
//  BYChildVCItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 子控制器数据
 */

import UIKit

struct BYChildVCItem {
    
    /// 返回主界面的子控制器(按顺序返回)
    ///
    /// - Returns: 子控制器数组
    static func getChildVCArr() -> [UIViewController] {
        /// 主页面控制器
        let homeVC = BYHomeVC()
        let homeNav = addNavigation(homeVC, #imageLiteral(resourceName: "tabBar-home"), #imageLiteral(resourceName: "tabBar-homeSelected"), "噪音世界")
        /// 我的控制器
        let mineVC = BYMineVC()
        let mineNav = addNavigation(mineVC, #imageLiteral(resourceName: "tabBar-mine"), #imageLiteral(resourceName: "tabBar-mineSelected"), "我的")
        
        return [homeNav, mineNav]
    }
    
    
    
    static private func addNavigation(_ rootVC: UIViewController, _ image: UIImage,_ selectedImage: UIImage, _ title: String?) -> BYNavigationVC {
        let navVC = BYNavigationVC(rootViewController: rootVC)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.selectedImage = selectedImage
        navVC.title = title
        navVC.topViewController?.title = title
        return navVC
    }
}
