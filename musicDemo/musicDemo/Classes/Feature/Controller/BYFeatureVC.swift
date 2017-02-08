//
//  BYFeatureVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/6/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//


/*
 新特性的控制器
 */
import UIKit
import YYImage

class BYFeatureVC: UIViewController {

    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let pictures = [YYImage(named:"0.png")!,YYImage(named:"1.gif")!, YYImage(named:"2.gif")!, YYImage(named:"3.gif")!]
        let newFeatureView = BYFeaturePageView.pageView(pictures)
        newFeatureView.delegate = self
        newFeatureView.frame = BYScreenBounds
        view.addSubview(newFeatureView)
    }

}


// MARK: - BYFeaturePageViewDelegate
extension BYFeatureVC: BYFeaturePageViewDelegate {
    func featurePageView(featurePageView: BYFeaturePageView) -> UIViewController {
        return BYTabBarVC()
    }
}
