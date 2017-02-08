//
//  BYAlbumItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class BYAlbumItem: BYBaseItem {
    
    /// 艺术家名
    var artist: String = ""
    
    /// 播放次数
    var playcount: Int = 0
    
    /// 包含的单曲
    var tracks: [BYTrackItem] = []
    
    /// 简介
    var wiki: BYWikiItem = BYWikiItem()
    

}
