//
//  BYSearchListItem.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit
import Alamofire
import MJExtension

class BYSearchListItem: NSObject {
    
    /// 搜索起始页
    var startPage: Int = 0
    
    /// 相册的搜索结果
    var albums: [BYAlbumItem]?
    
    /// 艺术家的搜索结果
    var artists: [BYArtistItem]?
    
    /// 单曲的搜索结果
    var tracks: [BYTrackItem]?
    
}


// MARK: - MJExtension 配置
extension BYSearchListItem {
    
    
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return [
            "startPage" : "opensearch:Query.startPage",
            "albums" : "albummatches.album",
            "artists" : "artistmatches.artist",
            "tracks" : "trackmatches.track"
        ]
    }
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return [
            "albums" : BYAlbumItem.self,
            "artists" : BYArtistItem.self,
            "tracks" : BYTrackItem.self
        ]
    }
    
}



// MARK: - 获取数据的方法
extension BYSearchListItem {

    /// 加载搜索的数据
    ///
    /// - Parameters:
    ///   - type: 搜索的类型
    ///   - content: 搜索的内容
    ///   - page: 搜索结果显示第几页 --- 默认第一页
    ///   - limit: 每页显示的行数 --- 默认 20 行
    ///   - result: 返回的结果模型
    static func loadResult(_ type: SearchType, _ content: String, _ page: Int = 1, _ limit: Int = 20,  _ complete:@escaping (BYSearchListItem)->()) {
        let typeStr = "\(type)"
        let para = [
            "method" : "\(typeStr).search",
            "\(typeStr)" : "\(content)",
            "api_key" : "\(BYAPIKey)",
            "format" : "json",
            "page" : 1,
            "limit" : 20
        ] as [String : Any]
        /// 请求数据
        Alamofire.request(BYBaseURL, method: .get, parameters: para, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse: DataResponse<Any>) in
            guard let JSON = dataResponse.result.value as? [String : Any] else {
                BYPrint("请求搜索数据失败")
                return
            }
            guard let results = JSON["results"] else {
                return
            }
            guard let result = BYSearchListItem.mj_object(withKeyValues: results) else {
                BYPrint("字典转模型失败")
                return
            }
            complete(result)
        }
    }
}
