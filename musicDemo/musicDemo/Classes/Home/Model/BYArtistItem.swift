//
//  BYArtistItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 艺术家模型
 */

import UIKit

class BYArtistItem: BYBaseItem {
    
    /// 相似的艺术家
    var similar: [BYArtistItem] = []
    
    override class func getType() -> String {
        return "artist"
    }
    
}

// MARK: - MJExtension 配置
extension BYArtistItem {
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        var result = super.mj_replacedKeyFromPropertyName()
        result?["playcount"] = "stats.playcount"
        result?["similar"] = "similar.artist"
        return result
    }
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return [
            "similar" : BYArtistItem.self
        ]
    }
}
