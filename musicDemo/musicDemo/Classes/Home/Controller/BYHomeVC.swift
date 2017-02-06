//
//  BYHomeVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

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
        ELPrint("searchClick")
    }
    /// 设置 UI
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
    }
}
