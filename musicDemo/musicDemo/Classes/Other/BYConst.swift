//
//  BYConst.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 常量和自定义 log
 */

import UIKit

/// 自定义 Log
func ELPrint<T>(_ message:T,
             file:String = #file,
             method:String = #function,
             line:Int = #line){
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)],\(method):\(message)")
    #endif
}


// MARK: - 屏幕尺寸
let BYScreenBounds = UIScreen.main.bounds
let BYScreenWidth = BYScreenBounds.width
let BYScreenHeight = BYScreenBounds.height
let BYNavigationBarHeight:CGFloat = 44
let BYTabBarHeight: CGFloat = 49
let BYStatusBarHeight: CGFloat = 20


// MARK: - BaseURL
let BYBaseURL = "http://ws.audioscrobbler.com/2.0"

// MARK: - 主题颜色
let BYNormalColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
let BYSelectedColor = UIColor(red: 12.0/255.0, green: 96.0/255.0, blue: 219.0/255.0, alpha: 1)
