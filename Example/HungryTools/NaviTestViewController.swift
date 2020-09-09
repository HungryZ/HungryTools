//
//  NaviTestViewController.swift
//  HungryTools_Example
//
//  Created by 张海川 on 2020/9/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class NaviTestViewController: BaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "NavigationTest"
        
        let button1 = UIButton(title: "push1", titleColor: .black, fontSize: 14, target: self, action: #selector(push1))
        button1.frame = CGRect(x: 50, y: 100, width: 100, height: 40)
        view.addSubview(button1)
        
        let button2 = UIButton(title: "push2", titleColor: .black, fontSize: 14, target: self, action: #selector(push2))
        button2.frame = CGRect(x: 200, y: 100, width: 100, height: 40)
        view.addSubview(button2)
    }
    
    @objc func push1() {
        navigationController?.pushViewController(NaviTestViewController(), animated: true)
    }
    
    @objc func push2() {
        navigationController?.pushViewController(NaviTest2ViewController(), animated: true)
    }

}

extension NaviTestViewController {
    
    func zhc_navigationControllerSingleAppearenceConfig() -> NaviBarConfigBlock {
    { naviBar in
        print("Single")
        naviBar.setBackgroundImage(UIImage(color: .orange), for: .default)
        naviBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .medium),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        }
    }
    
    func zhc_navigationControllerBackItemTintColor() -> UIColor {
        .white
    }
    
}
