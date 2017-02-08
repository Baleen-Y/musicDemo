//
//  BYWikiVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/8/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 详情介绍控制器
    由于时间关系，这里只做了简单的解析，没做太多美化处理，为了快速开发并且用了 xib
 */
import UIKit

class BYWikiVC: UIViewController {

    // MARK: - 属性
    var wikiItem: BYWikiItem?
    
    @IBOutlet weak var webView: UIWebView!
    
    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadWeb()
    }

}

// MARK: - 加载数据
extension BYWikiVC {
    
    /// 加载网页
    fileprivate func loadWeb() {
        
        guard let wikiItem = wikiItem else {
            return
        }
        let dateStr = "发布时间:" + wikiItem.published
        let summary = "摘要:" + wikiItem.summary
        let content = wikiItem.content
        
        
        /// 生成标签
        let dateHtml = "<div id=\"date\">\(dateStr)</div>"
        let summaryHtml = "<div id=\"summary\">\(summary)</div>"
        let contentHtml = "<div id=\"content\"><p>\(content)</p></div>"
        
        /// 引入 css 文件
        let css = Bundle.main.url(forResource: "wiki", withExtension: "css")
        let cssHtml = "<link href=\"\(css!)\" rel=\"stylesheet\">"
        /// 引入 js 文件
        let js = Bundle.main.url(forResource: "wiki", withExtension: "js")
        let jsHtml = "<script src=\"\(js!)\"></script>"
        let html = "<html>" +
            "<head>\(cssHtml)</head>" + "<body>\(dateHtml)\(summaryHtml)\(contentHtml)\(jsHtml)</body>" + "</html>"
        /// 加载 html
        self.webView.loadHTMLString(html, baseURL: nil)
    }
}
