//
//  BYDetailVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 详情页面控制器
 */
import UIKit
import MJRefresh

class BYDetailVC: UIViewController {
    
    // MARK: - 属性
    
    /// 头部 View
    lazy var topView: BYTopDetailView = {
        /// 创建详情的头部
        let topView = BYTopDetailView.topView()
        topView.frame = CGRect(x: 0, y: BYStatusBarHeight + BYNavigationBarHeight, width: BYScreenWidth, height: BYTopDeatailH)
        topView.delegate = self
        self.view.addSubview(topView)
        return topView
    }()
    
    /// 列表控制器
    lazy var listVC: BYListTVC = {
        let listVC = BYListTVC()
        listVC.tableView.mj_footer.isHidden = true
        listVC.tableView.mj_header.isHidden = true
        let y = BYStatusBarHeight + BYNavigationBarHeight + BYTopDeatailH
        let h = BYScreenHeight - y
        listVC.view.frame = CGRect(x: 0, y: y, width: BYScreenWidth, height: h)
        self.view.addSubview(listVC.view)
        return listVC
    }()
    
    /// 数据模型
    var item: BYBaseItem? {
        didSet {
            guard let item = item else {
                return
            }
            topView.item = item
            self.title = item.name
            if item.isKind(of: BYAlbumItem.self) {
                let tracks = (item as! BYAlbumItem).tracks
                listVC.results = tracks
            }
            
            if item.isKind(of: BYArtistItem.self) {
                let artists = (item as! BYArtistItem).similar
                listVC.results = artists
            }
            
            if item.isKind(of: BYTrackItem.self) {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

// MARK: - 自定义方法
extension BYDetailVC {
    
    /// 设置 UI
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
    }
    
}

// MARK: - BYTopDetailViewDelegate
extension BYDetailVC: BYTopDetailViewDelegate {
    func detailViewWikiClick(_ topDetailView: BYTopDetailView) {
        /// 创建 wiki 控制器
        let wikiVC = BYWikiVC()
        wikiVC.wikiItem = item?.wiki
        navigationController?.pushViewController(wikiVC, animated: true)
    }
}
