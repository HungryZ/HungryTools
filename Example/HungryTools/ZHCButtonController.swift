//
//  ZHCButtonController.swift
//  HungryTools_Example
//
//  Created by 张海川 on 2021/1/7.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class ZHCButtonController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let button = ZHCButton()
        button.setImage(UIImage(named: "image_alipay"), for: .normal)
        button.backgroundColor = .lightGray
        button.setTitle("BTN", for: .normal)
        button.setTitle("SELECTED", for: .selected)
        button.setTitle("SELECTED", for: [.selected, .highlighted])
        button.setTitleColor(.purple, for: .normal)
//        button.setBackgroundImage(UIImage(named: "background"), for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.zhc_spacing = 10
        button.zhc_alignment = .horizontal
        button.zhc_padding = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40)
        
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.isSelected = true
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 200, height: 200))
        }
    }

}
