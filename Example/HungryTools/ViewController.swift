//
//  ViewController.swift
//  HungryTools
//
//  Created by Hungry on 02/09/2020.
//  Copyright (c) 2020 Hungry. All rights reserved.
//

import UIKit
import HungryTools
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .gray
//        OCTester.test()
        
//        let field = ZHCTextField()
//        field.backgroundColor = .white
//        field.frame = CGRect(x: 12, y: 200, width: 414 - 24, height: 44)
//        field.leftText = "测试"
//        field.fieldType = .password
//        view.addSubview(field)
        
        let button = ZHCButton(title: "123456789", titleColor: .black, fontSize: 16, target: nil, action: nil)
        button.setImage(UIImage(named: "image_alipay"), for: .normal)
        button.backgroundColor = .white
        button.zhc_spacing = 40
        button.zhc_alignment = .vertical
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
        
        let label = UILabel(font: 14, text: "1234")
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(button);
            make.left.equalTo(button.snp_right)
        }
        
        let label2 = UILabel(font: 14, text: "1234")
        view.addSubview(label2)
        label2.snp.makeConstraints { (make) in
            make.left.equalTo(button);
            make.top.equalTo(button.snp_bottom)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

