//
//  BYTopDetailView.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/8/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 自定义的详情页面的头部 View，为了快速开发用了 xib
 */
import UIKit
import YYWebImage


/// 头部 View 协议
protocol BYTopDetailViewDelegate {
    
    /// 更多信息的点击
    func detailViewWikiClick(_ topDetailView: BYTopDetailView);
}

class BYTopDetailView: UIView {
    
    // MARK: - 属性
    
    /// 代理
    var delegate: BYTopDetailViewDelegate?
    
    /// 数据模型
    var item: BYBaseItem? {
        didSet {
            guard let item = item else {
                return
            }
            self.nameLabel.text = item.name
            self.iconImageView.yy_setImage(with: item.imageLarge.url(), placeholder: #imageLiteral(resourceName: "placeholder"))
            var count = CGFloat(item.listeners)
            self.listenersLabel.text = "\(count)人已收听"
            if count > 10000 {
                count = count / 10000.0
                self.listenersLabel.text = String(format: "%.1f万人已收听", count)
            }
            
            
            var countPlay = CGFloat(item.playcount)
            self.playcountLabel.text = "\(item.playcount)"
            if countPlay > 10000 {
                countPlay = countPlay / 10000.0
                self.playcountLabel.text = String(format: "%.1f万", countPlay)
            }
            if item.wiki == nil {
                wikiButton.isHidden = true
            } else {
                wikiButton.isHidden = false
            }
            if item.isKind(of: BYArtistItem.self) {
                artistLabel.isHidden = true
            } else {
                artistLabel.isHidden = false
                if let item = item as? BYAlbumItem {
                    artistLabel.text = item.artist
                }
                if let item = item as? BYTrackItem {
                    artistLabel.text = item.artist
                }
            }
        }
    }
    
    /// 图像
    @IBOutlet weak var iconImageView: UIImageView!
    
    /// 名字
    @IBOutlet weak var nameLabel: UILabel!
    
    /// 艺术家
    @IBOutlet weak var artistLabel: UILabel!
    
    /// 播放次数
    @IBOutlet weak var playcountLabel: UILabel!
    
    /// 听众
    @IBOutlet weak var listenersLabel: UILabel!
    
    /// 播放控件
    @IBOutlet weak var playView: UIView!
    
    /// 更多信息按钮
    @IBOutlet weak var wikiButton: UIButton!
    
    
}

// MARK: - 自定义方法
extension BYTopDetailView {
    
    /// 类工厂方法
    class func topView() -> BYTopDetailView {
        return Bundle.main.loadNibNamed("BYTopDetailView", owner: nil, options: nil)?.last as! BYTopDetailView
    }
    
    /// 更多按钮的点击
    @IBAction func wikiButtonClick() {
        if let delegate = delegate {
            delegate.detailViewWikiClick(self)
        }
        
    }
    
}

