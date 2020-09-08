//
//  ZHCTextFieldController.swift
//  HungryTools_Example
//
//  Created by 张海川 on 2020/9/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ZHCTextFieldController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        var field = ZHCTextField(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50))
        field.showBottomLine = true
        view.addSubview(field)
        
        field = ZHCTextField(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: 50))
        field.showBottomLine = true
        view.addSubview(field)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
