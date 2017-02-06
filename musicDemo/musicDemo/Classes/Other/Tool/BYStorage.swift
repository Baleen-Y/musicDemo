//
//  BYStorage.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/6/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 保存和获取用户小数据类型
 */

import UIKit

struct BYStorage {
    
    /// 保存数据
    static func set(_ object: Any?, forKey:String) {
        UserDefaults.standard.set(object, forKey: forKey)
    }
    
    /// 获取数据
    static func object(forKey: String) -> Any? {
        return UserDefaults.standard.object(forKey: forKey)
    }
}
