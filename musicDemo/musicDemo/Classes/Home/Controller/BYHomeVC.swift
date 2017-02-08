//
//  BYHomeVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 主页面控制器
 */

import UIKit

class BYHomeVC: UIViewController {
    
    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
    }
    
}

// MARK: - 自定义方法
extension BYHomeVC {
    /// 设置导航栏
    fileprivate func setupNavigation() {
        /// 设置导航栏右侧
        navigationItem.rightBarButtonItem = UIBarButtonItem.highlightItem(#imageLiteral(resourceName: "navigationBar-search"), nil, self, action: #selector(search))
    }
    /// 搜索按钮点击
    @objc fileprivate func search() {
        /// 跳转搜索界面
        let searchVC = BYSearchVC()
        let searchNav = BYNavigationVC(rootViewController: searchVC)
        present(searchNav, animated: true, completion: nil)
    }
    /// 设置 UI
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
        /// 创建单曲列表的控制器
        let listVC = BYListTVC()
        listVC.para = (SearchType.track, "Believe")
        automaticallyAdjustsScrollViewInsets = false
        let y = BYStatusBarHeight + BYNavigationBarHeight
        let h = BYScreenHeight - y - BYTabBarHeight
        listVC.view.frame = CGRect(x: 0, y: y, width: BYScreenWidth, height: h)
        addChildViewController(listVC)
        view.addSubview(listVC.view)
    }
}
