//
//  BYTrackItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 单曲模型
 */

import UIKit

class BYTrackItem: BYBaseItem {
    
    /// 时长(秒)
    var duration: TimeInterval = 0.0
    
    /// 艺术家名
    var artist: String = ""
    
    // MARK: - 重写方法
    override class func getType() -> String {
        return "track"
    }
    
}

// MARK: - MJExtension 配置
extension BYTrackItem {
    
}
