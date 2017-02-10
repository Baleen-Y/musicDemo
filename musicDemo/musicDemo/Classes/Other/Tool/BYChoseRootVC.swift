//
//  BYChoseRootVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/6/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 选择根控制器的工具
 */

import UIKit

fileprivate let BYVersion = "version"

class BYChoseRootVC: NSObject {
    static let tabBarVC = BYTabBarVC()
//    static let FeatureVC = BYFeatureVC()
    static func choseRootVC() -> UIViewController {
        /// 1. 获取当前版本号
        let curVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        /// 2. 获取上一次的版本号
        let preVersion = BYStorage.object(forKey: BYVersion) as? String ?? ""
        /// 3. 判断版本号是否相等
        #if DEBUG
            return BYFeatureVC()
        #else
            if curVersion == preVersion {
                return tabBarVC
            } else {
                BYStorage.set(curVersion, forKey: BYVersion)
                return BYFeatureVC()
            }
        #endif
    }
}
