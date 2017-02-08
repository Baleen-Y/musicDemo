//
//  BYSearchVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 搜索界面控制器
 */

import UIKit
class BYSearchVC: UIViewController {
    
    // MARK: - 属性
    var popOptionVC: BYPopTVC?
    lazy var listVC: BYListTVC = {
        let listVC = BYListTVC()
        self.automaticallyAdjustsScrollViewInsets = false
        let y = BYNavigationBarHeight + BYStatusBarHeight
        let w = BYScreenWidth
        let h = BYScreenHeight - y
        listVC.view.frame = CGRect(x: 0, y: y, width: w, height: h)
        self.view.addSubview(listVC.view)
        self.addChildViewController(listVC)
        return listVC
    }()
    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
    }
    
}


// MARK: - 自定义方法
extension BYSearchVC {
    
    fileprivate func setupNavigation() {
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        /// 创建搜索栏
        let searchBar = BYSearhBar()
        searchBar.type = SearchType.album
        searchBar.delegate = self
        searchBar.frame = navigationBar.bounds
        navigationBar.addSubview(searchBar)
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
        
        /// 创建弹出的选择框
        let popVC = BYPopTVC()
        popVC.typeArr = [SearchType.album, SearchType.artist, SearchType.track]
        popVC.modalPresentationStyle = .popover
        popVC.preferredContentSize = CGSize(width: BYSearchTypeCellW, height: BYSearchTypeCellH * CGFloat(BYSearchTypeCount))
        popOptionVC = popVC
    }
    
    
    fileprivate func popover(_ soureView: UIView) {
        guard let popoverVC = popOptionVC?.popoverPresentationController else {
            return
        }
        popOptionVC?.typeBtn = soureView as? UIButton
        popoverVC.backgroundColor = UIColor.lightGray
        popoverVC.delegate = self
        popoverVC.sourceView = soureView
        popoverVC.sourceRect = soureView.bounds
        present(popOptionVC!, animated: true, completion: nil)
        
    }
}


// MARK: - UIPopoverPresentationControllerDelegate
extension BYSearchVC: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - BYSearhBarDelegate
extension BYSearchVC: BYSearhBarDelegate {
    func searchBarCancel(searchBar: BYSearhBar) {
        dismiss(animated: true, completion: nil)
    }
    
    func searchBarOption(searchBar: BYSearhBar, typeBtn: UIButton?) {
        guard let typeBtn = typeBtn else {
            return
        }
        /// 弹出选择框
        popover(typeBtn)
    }
    func searchBarDone(searchBar: BYSearhBar, typeBtn: UIButton?, content: String) {
        
        /// 拿到搜索的类型
        let type = SearchType(rawValue: typeBtn?.currentTitle ?? "单曲")!
        listVC.para = (type, content)
        
    }
}
