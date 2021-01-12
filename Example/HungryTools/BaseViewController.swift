//
//  BaseViewController.swift
//  HungryTools_Example
//
//  Created by 张海川 on 2020/9/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
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

extension BaseViewController: ZHCNavigationControllerDelegate {
    
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
        }
    }
}
