//
//  BYPopTVC.swift
//  musicDemo
//
//  Created by Baleen.Y on 2/7/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//
/*
 搜索弹出选择类型控制器
 */
import UIKit

/// cell 标识符
fileprivate let identifier = "popCell"

class BYPopTVC: UITableViewController {
    // MARK: - 属性
    var typeBtn: UIButton?
    
    var typeArr: [SearchType]? {
        didSet {
            tableView.reloadData()
        }
    }
    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.lightGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.separatorInset.left = 0
    }
    
}

// MARK: - 数据源和代理方法
extension BYPopTVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let typeArr = typeArr else {
            return 0
        }
        return typeArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = typeArr?[indexPath.row].rawValue
        cell.backgroundColor = UIColor.lightGray
        cell.textLabel?.font = UIFont.systemFont(ofSize: 10)
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BYSearchTypeCellH
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = typeArr?[indexPath.row].rawValue
        typeBtn?.setTitle(type, for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
}

