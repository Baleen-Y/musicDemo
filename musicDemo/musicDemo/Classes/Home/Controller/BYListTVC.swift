//
//  BYListTVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class BYListTVC: UITableViewController {
    
    // MARK: - 模型数据数组
    var resultAlbum: [BYAlbumItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var resultArtist: [BYArtistItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var resultTrack: [BYTrackItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var currenPage: Int = 0
    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


// MARK: - Table view data source
extension BYListTVC {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultTrack.count > 0 {
            return resultTrack.count
        }
        if resultArtist.count > 0 {
            return resultArtist.count
        }
        return resultAlbum.count
    }
    

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BYListCell.cell(tableView)
        if resultTrack.count > 0 {
            cell.item = resultTrack[indexPath.row]
        }
        if resultArtist.count > 0 {
            cell.item = resultArtist[indexPath.row]
        }
        if resultAlbum.count > 0 {
            cell.item = resultAlbum[indexPath.row]
        }
        return cell
     }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BYImageMediumWH + 2*BYMargin
    }
    
}

