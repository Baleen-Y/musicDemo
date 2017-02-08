//
//  StringExtension.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/8/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 
 String 类拓展
 */

import UIKit

extension String {
    
    /// 快速获取字符串对应的 URL
    func url() -> URL? {
        guard let url = URL(string: self) else {
            return nil
        }
        return url
    }
    
}
