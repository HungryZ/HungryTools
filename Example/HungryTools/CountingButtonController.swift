//
//  CountingButtonController.swift
//  HungryTools_Example
//
//  Created by 张海川 on 2021/3/5.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import HungryTools

class CountingButtonController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "CountingButton"
        view.backgroundColor = .white
        
        let countingButton = ZHCCountingButton(normalTitle: "获取验证码",
                                               countingTitle: "(%d)",
                                               recoveredTitle: "重新获取",
                                               normalTitleColor: .black,
                                               countingTitleColor: .lightGray,
                                               fontSize: 14,
                                               countingSeconds: 60)
        countingButton.frame = CGRect(x: 50, y: 200, width: 100, height: 32)
        countingButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        
        view.addSubview(countingButton)
    }
    
    @objc
    func buttonClicked(sender: ZHCCountingButton) {
        sender.startCounting()
    }
    
}
