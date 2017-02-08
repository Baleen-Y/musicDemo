//
//  BYSearhBar.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

enum SearchType : String {
    case track = "单曲"    /// 单曲
    case artist = "艺术家"  /// 艺术家
    case album = "专辑"    /// 专辑
}

/// BYSearhBar 协议
protocol BYSearhBarDelegate {
    
    /// 取消搜索
    func searchBarCancel(searchBar: BYSearhBar)
    /// 选项按钮
    func searchBarOption(searchBar: BYSearhBar, typeBtn: UIButton?)
    /// 搜索按钮点击
    func searchBarDone(searchBar: BYSearhBar, typeBtn: UIButton?, content: String)
}

class BYSearhBar: UIView {

    // MARK: - 属性
    fileprivate var searchBar: UISearchBar?
    fileprivate var typeBtn: UIButton?
    fileprivate var cancelBtn: UIButton?
    var type: SearchType? {
        didSet {
            typeBtn?.setTitle(type?.rawValue, for: .normal)
        }
    }
    var delegate: BYSearhBarDelegate?
    
    // MARK: - 重写方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// 添加子控件
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "请输入搜索的关键字"
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        self.searchBar = searchBar
        let typeBtn = UIButton(type: .custom)
        typeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        typeBtn.setTitleColor(UIColor.darkGray, for: .normal)
        typeBtn.addTarget(self, action: #selector(pickType), for: .touchUpInside)
        self.typeBtn = typeBtn
        let cancelBtn = UIButton(type: .custom)  /// 自定义取消按钮,没用系统的
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        cancelBtn.setTitleColor(UIColor.black, for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelClick), for: .touchUpInside)
        self.cancelBtn = cancelBtn
        addSubview(searchBar)
        addSubview(typeBtn)
        addSubview(cancelBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar?.becomeFirstResponder()
        
        /// 数据
        let buttonW: CGFloat = 50
        let buttonH: CGFloat = 30
        let margin: CGFloat = 5
        
        
        let typeBtnX = margin
        let typeBtnY = (frame.height - buttonH) * 0.5
        typeBtn?.frame = CGRect(x: typeBtnX, y: typeBtnY, width: buttonW, height: buttonH)
        
        let searchW = frame.width - 2*margin - 2*buttonW
        let searchH = buttonH
        let searchX: CGFloat = margin + buttonW
        let searchY: CGFloat = typeBtnY
        searchBar?.frame = CGRect(x: searchX, y: searchY, width: searchW, height: searchH)
        
        let cancelBtnX = frame.width - margin - buttonW
        let cancelBtnY = searchY
        cancelBtn?.frame = CGRect(x: cancelBtnX, y: cancelBtnY, width: buttonW, height: buttonH)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UISearchBarDelegate
extension BYSearhBar: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let content = searchBar.text else {
            return
        }
        searchBar.resignFirstResponder()
        if let delegate = delegate {
            delegate.searchBarDone(searchBar: self, typeBtn: typeBtn, content: content)
        }
    }
}

// MARK: - 自定义方法
extension BYSearhBar {
    @objc fileprivate func cancelClick() {
        searchBar?.resignFirstResponder()

        if let delegate = delegate {
            delegate.searchBarCancel(searchBar: self)
        }
    }
    @objc fileprivate func pickType() {
        if let delegate = delegate {
            delegate.searchBarOption(searchBar: self, typeBtn: typeBtn)
        }
    }
}

