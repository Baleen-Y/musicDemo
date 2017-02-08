//
//  BYBaseItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 搜索的3大种类的基模型
 */
import UIKit
import MJExtension
import Alamofire

class BYBaseItem: NSObject {
    
    /// 名字
    var name: String = ""
    
    /// 听众
    var listeners: Int = 0
    
    /// 播放次数
    var playcount: Int = 0
    
    /// 小图 34*34
    var imageSmall: String = ""
    
    /// 中图 64*64
    var imageMedium: String = ""
    
    /// 大图 174*174
    var imageLarge: String = ""
    
    /// 超大图 300*300
    var imageExtralarge: String = ""
    
    /// 简介
    var wiki: BYWikiItem?
    
    class func getType() -> String {
        return ""
    }
    
}

// MARK: - MJExtension 配置
extension BYBaseItem {
    override class func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return [
            "imageSmall" : "image[0].#text",
            "imageMedium" : "image[1].#text",
            "imageLarge" : "image[2].#text",
            "imageExtralarge" : "image[3].#text"
        ]
    }
    
}

// MARK: - 获取数据
extension BYBaseItem {
    
    /// 获取数据
    ///
    /// - Parameters:
    ///   - name: 获得名字
    ///   - artist: 获取的艺术家
    ///   - complete: 返回的结果
    class func getData(_ name: String, _ artist: String?, _ complete:@escaping (BYBaseItem)->()) {
        var para = [
            self.getType() : name,
            "method" : "\(self.getType()).getinfo",
            "api_key" : "\(BYAPIKey)",
            "format" : "json",
            ]
        if let artist = artist {
            para["artist"] = artist
        }
        /// 请求数据
        Alamofire.request(BYBaseURL, method: .get, parameters: para, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse: DataResponse<Any>) in
            
            guard let JSON = dataResponse.result.value as? [String : Any] else {
                BYPrint("请求搜索数据失败")
                return
            }
            guard let results = JSON["\(self.getType())"] else {
                return
            }
            guard let result = self.mj_object(withKeyValues: results) else {
                BYPrint("字典转模型失败")
                return
            }
            complete(result)
        }
        
    }
    
}


