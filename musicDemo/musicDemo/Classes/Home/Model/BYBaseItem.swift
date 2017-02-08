//
//  BYBaseItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class BYBaseItem: NSObject {
    
    /// 名字
    var name: String = ""
    
    /// 听众
    var listeners: Int = 0
    
    /// 小图 34*34
    var imageSmall: String = ""
    
    /// 中图 64*64
    var imageMedium: String = ""
    
    /// 大图 174*174
    var imageLarge: String = ""
    
    /// 超大图 300*300
    var imageExtralarge: String = ""
    
}

// MARK: - MJExtension 配置
extension BYBaseItem {
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return [
            "imageSmall" : "image[0].#text",
            "imageMedium" : "image[1].#text",
            "imageLarge" : "image[2].#text",
            "imageExtralarge" : "image[3].#text"
        ]
    }

}
