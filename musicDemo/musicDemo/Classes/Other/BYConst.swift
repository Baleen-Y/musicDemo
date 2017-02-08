//
//  BYConst.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 常量和自定义 log
 http://ws.audioscrobbler.com/2.0/?method=album.search&album=believe&api_key=9effd6f185e6ff3015599fc4f8e9539e&format=json&page=2&limit=20
 
 http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=9effd6f185e6ff3015599fc4f8e9539e&artist=Cher&album=Believe&format=json
 */

import UIKit

// MARK: - 自定义 Log
func BYPrint<T>(_ message:T,
             file:String = #file,
             method:String = #function,
             line:Int = #line){
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)],\(method):\(message)")
    #endif
}


// MARK: - 屏幕相关尺寸
let BYScreenBounds = UIScreen.main.bounds
let BYScreenWidth = BYScreenBounds.width
let BYScreenHeight = BYScreenBounds.height
let BYNavigationBarHeight:CGFloat = 44
let BYTabBarHeight: CGFloat = 49
let BYStatusBarHeight: CGFloat = 20


// MARK: - BaseURL
let BYBaseURL = "http://ws.audioscrobbler.com/2.0"
let BYAPIKey = "9effd6f185e6ff3015599fc4f8e9539e"

// MARK: - 主题颜色
let BYNormalColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
let BYSelectedColor = UIColor(red: 12.0/255.0, green: 96.0/255.0, blue: 219.0/255.0, alpha: 1)

// MARK: - 搜索相关
let BYSearchTypeCount = 3
let BYSearchTypeCellW: CGFloat = 70
let BYSearchTypeCellH: CGFloat = 35

// MARK: - listCell 相关
let BYImageSmallWH: CGFloat = 34
let BYImageMediumWH: CGFloat = 64
let BYImageLargeWH: CGFloat = 174
let BYImageExtralarge: CGFloat = 300
let BYMargin: CGFloat = 10


