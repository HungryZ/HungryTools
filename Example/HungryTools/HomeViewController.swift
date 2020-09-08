//
//  HomeViewController.swift
//  HungryTools
//
//  Created by Hungry on 02/09/2020.
//  Copyright (c) 2020 Hungry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let dataArray = ["ZHCTextField", "1", "2"]
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        return tableView
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "HungryTools"
        view.backgroundColor = .white
        zhc_hideNavigationBar = false
        
        view.addSubview(mainTableView)
        mainTableView.frame = view.bounds
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: CGFloat((arc4random() % 255)) / 255.0,
                       green: CGFloat((arc4random() % 255)) / 255.0,
                       blue: CGFloat((arc4random() % 255)) / 255.0,
                       alpha: 1)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.zhc_separatorLineInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cell.zhc_showTopSeparatorLine = indexPath.row != 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC: UIViewController?
        
        switch indexPath.row {
        case 0:
            nextVC = ZHCTextFieldController()
        default:
            nextVC = nil
        }
        if let vc = nextVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: ZHCNavigationControllerDelegate {
    
    func zhc_navigationControllerCanPopBack() -> Bool {
//        navigationController?.popViewController(animated: true)
        return true
    }
    
    func zhc_navigationControllerBackItemContent() -> Any {
        "back"
    }
    
//    func zhc_navigationControllerBackItemTintColor() -> UIColor {
//        .red
//    }
    
    func zhc_navigationControllerDefaultAppearenceConfig() -> NaviBarConfigBlock {
    { naviBar in
        naviBar.setBackgroundImage(UIImage(color: .white), for: .default)
        naviBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .medium),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        naviBar.tintColor = .black
        }
    }
}
