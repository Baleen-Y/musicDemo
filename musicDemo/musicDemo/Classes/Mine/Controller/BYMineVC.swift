//
//  BYMineVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 我的界面控制器, 时间关系，这里没做界面处理，有更多的好想法。
 */
import UIKit

class BYMineVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
    }
}


// MARK: - 自定义方法
extension BYMineVC {
    /// 设置导航栏
    fileprivate func setupNavigation() {
        /// 设置右侧设置按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem.highlightItem(#imageLiteral(resourceName: "navigationBar-setting"), nil, self, action: #selector(settingClick))
    }
    /// 设置按钮的点击
    @objc fileprivate func settingClick() {
        BYPrint("settingClick")
    }
    /// 设置 UI
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
    }
}
