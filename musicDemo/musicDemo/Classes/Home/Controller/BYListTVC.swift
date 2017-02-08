//
//  BYListTVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 列表控制器
 */
import UIKit
import MJRefresh

class BYListTVC: UITableViewController {
    
    // MARK: - 属性
    var results: [BYBaseItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var para: (type: SearchType, content: String)? {
        didSet {
            if !self.tableView.mj_header.isRefreshing() {
                self.tableView.mj_header.beginRefreshing()
            }
            loadNewData()
        }
    }
    
    var currenPage: Int = 0
    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefresh()
    }
    
}

// MARK: - 自定义方法
extension BYListTVC {
    fileprivate func setupRefresh() {
        /// 设置下拉刷新
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        
        /// 设置上拉刷新
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        
    }
    
    
    
    @objc fileprivate func loadNewData() {
        guard let para = para else {
            return
        }
        /// 加载数据
        BYSearchListItem.loadResult(para.type, para.content) { (results: BYSearchListItem?, error: String?) in
            if error != nil {
                BYPrint(error!)
                self.tableView.mj_header.endRefreshing()
                return
            }
            guard let results = results else {
                return
            }
            self.tableView.mj_header.endRefreshing()
            self.currenPage = results.startPage
            if let albums = results.albums {
                self.results = albums
            }
            if let artists = results.artists {
                self.results = artists
            }
            if let tracks = results.tracks {
                self.results = tracks
            }
        }
    }
    
    @objc fileprivate func loadMoreData() {
        guard let para = para else {
            return
        }
        /// 加载数据
        BYSearchListItem.loadResult(para.type, para.content, page: currenPage+1) { (results: BYSearchListItem?, error: String?) in
            if error != nil {
                BYPrint(error!)
                self.tableView.mj_footer.endRefreshing()
                return
            }
            guard let results = results else {
                return
            }
            self.tableView.mj_footer.endRefreshing()
            self.currenPage = results.startPage
            if let albums = results.albums {
                
                self.results = self.results + albums
            }
            if let artists = results.artists {
                
                self.results = self.results + artists
            }
            if let tracks = results.tracks {
                
                self.results = self.results + tracks
            }
            
        }
    }
}


// MARK: - Table view data source
extension BYListTVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BYListCell.cell(tableView)
        cell.item = results[indexPath.row]
        return cell
    }
    
    
    
}


// MARK: - 代理方法
extension BYListTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BYImageMediumWH + 2 * BYMargin
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /// 跳转详情界面
        let detailVC = BYDetailVC()
        let item = results[indexPath.row]
        if item.isKind(of: BYAlbumItem.self) {
            BYAlbumItem.getData(item.name, (item as! BYAlbumItem).artist, { (result: BYBaseItem) in
                guard let result = result as? BYAlbumItem else {
                    return
                }
                detailVC.item = result
            })
        }
        
        if item.isKind(of: BYArtistItem.self) {
            BYArtistItem.getData(item.name, nil, { (result: BYBaseItem) in
                guard let result = result as? BYArtistItem else {
                    return
                }
                result.listeners = item.listeners
                detailVC.item = result
            })
        }
        
        if item.isKind(of: BYTrackItem.self) {
            BYTrackItem.getData(item.name, (item as! BYTrackItem).artist, { (result: BYBaseItem) in
                guard let result = result as? BYTrackItem else {
                    return
                }
                result.artist = (item as! BYTrackItem).artist
                result.imageLarge = item.imageLarge
                detailVC.item = result
            })
        }
        
        parent?.dismiss(animated: false, completion: nil)
        let baseVC = UIApplication.shared.keyWindow?.rootViewController as! BYTabBarVC
        let navVC = baseVC.selectedViewController as! BYNavigationVC
        detailVC.hidesBottomBarWhenPushed = true
        navVC.pushViewController(detailVC, animated: true)
        
        
    }
}


