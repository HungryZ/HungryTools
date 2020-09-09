//
//  ZHCTextFieldController.swift
//  HungryTools_Example
//
//  Created by 张海川 on 2020/9/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ZHCTextFieldController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var field = ZHCTextField(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50))
        field.showBottomLine = true
        field.leftText = "1111"
        field.bottomLineHeight = 10
        field.rightView = UILabel(font: 14, text: "right")
        field.rightViewMode = .always
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
