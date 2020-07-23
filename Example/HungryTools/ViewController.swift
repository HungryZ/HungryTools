//
//  ViewController.swift
//  HungryTools
//
//  Created by Hungry on 02/09/2020.
//  Copyright (c) 2020 Hungry. All rights reserved.
//

import UIKit
import HungryTools

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.lightGray
        OCTester.test()
        
        let field = ZHCTextField()
        field.backgroundColor = .white
        field.frame = CGRect(x: 12, y: 200, width: 414 - 24, height: 44)
        field.leftText = "测试"
        field.fieldType = .password
        view.addSubview(field)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

