//
//  BYListCell.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

/*
 自定义列表的 cell
 */
import UIKit
import YYWebImage

/// 标识符
fileprivate let identifier = "listCell"

class BYListCell: UITableViewCell {
    
    // MARK: - 属性
    var item: BYBaseItem? {
        didSet {
            guard let item = item else {
                return
            }
            
            self.nameLabel.text = item.name
            self.iconImageView.yy_setImage(with: item.imageMedium.url(), placeholder: #imageLiteral(resourceName: "placeholder"))
            
            if item.isKind(of: BYAlbumItem.self) {
                self.artistLabel.isHidden = false
                self.artistLabel.text = (item as! BYAlbumItem).artist
            }
            
            if item.isKind(of: BYArtistItem.self) {
                self.artistLabel.isHidden = true
                
            }
            
            if item.isKind(of: BYTrackItem.self) {
                self.artistLabel.isHidden = false
                self.artistLabel.text = (item as! BYTrackItem).artist
            }
            
            if item.listeners == 0 {
                listenersLabel.isHidden = true
            } else {
                listenersLabel.isHidden = false
                var count = CGFloat(item.listeners)
                self.listenersLabel.text = "\(count)人已收听"
                if count > 10000 {
                    count = count / 10000.0
                    self.listenersLabel.text = String(format: "%.1f万人已收听", count)
                }
            }
        }
    }
    
    fileprivate var iconImageView: UIImageView!
    fileprivate var nameLabel: UILabel!
    fileprivate var artistLabel: UILabel!
    fileprivate var listenersLabel: UILabel!
    
    // MARK: - 重写方法
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubViews()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 类工厂方法
    class func cell(_ tableView: UITableView) -> BYListCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = BYListCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        return cell as! BYListCell
    }
    
}

// MARK: - 自定义方法
extension BYListCell {
    fileprivate func setupSubViews() {
        
        /// 图片
        let iconImageView = UIImageView()
        self.iconImageView = iconImageView
        /// 名字
        let nameLabel = UILabel()
        self.nameLabel = nameLabel
        /// 艺术家
        let artistLabel = UILabel()
        artistLabel.font = UIFont.systemFont(ofSize: 13)
        artistLabel.textColor = UIColor.lightGray
        self.artistLabel = artistLabel
        /// 听众
        let listenersLabel = UILabel()
        listenersLabel.font = UIFont.systemFont(ofSize: 13)
        listenersLabel.textColor = UIColor.lightGray
        self.listenersLabel = listenersLabel
        
        /// 添加
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(artistLabel)
        addSubview(listenersLabel)
        
    }
    
    fileprivate func setupUI() {
        /// 图片
        let iconX = BYMargin
        let iconY = iconX
        let iconWH = BYImageMediumWH
        iconImageView.frame = CGRect(x: iconX, y: iconY, width: iconWH, height: iconWH)
        /// 名字
        let nameX = iconImageView.frame.maxX + BYMargin
        let nameY = iconY
        let nameW = BYScreenWidth - nameX - BYMargin
        let nameH = CGFloat(20)
        nameLabel.frame = CGRect(x: nameX, y: nameY, width: nameW, height: nameH)
        /// 艺术家
        let artistX = nameX
        let artistY = nameLabel.frame.maxY + BYMargin
        let artistW = nameW
        let artistH = CGFloat(15)
        artistLabel.frame = CGRect(x: artistX, y: artistY, width: artistW, height: artistH)
        /// 听众人数
        let listenersX = nameX
        let listenersH = CGFloat(15)
        let listenersY = iconImageView.frame.maxY - listenersH
        let listenersW = nameW
        listenersLabel.frame = CGRect(x: listenersX, y: listenersY, width: listenersW, height: listenersH)
    }
    
}
