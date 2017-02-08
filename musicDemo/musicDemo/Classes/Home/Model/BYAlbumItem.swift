//
//  BYAlbumItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 专辑模型
 */
import UIKit

class BYAlbumItem: BYBaseItem {
    
    /// 艺术家名
    var artist: String = ""
    
    /// 包含的单曲
    var tracks: [BYTrackItem] = []
    
    override class func getType() -> String {
        return "album"
    }
    
}

// MARK: - MJExtension 配置
extension BYAlbumItem {
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        var result = super.mj_replacedKeyFromPropertyName()
        result?["tracks"] = "tracks.track"
        return result
    }
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return [
            "tracks" : BYTrackItem.self
        ]
    }
}
