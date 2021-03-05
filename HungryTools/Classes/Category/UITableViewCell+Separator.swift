//
//  UITableViewCell+Separator.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

import ObjectiveC.runtime

var Key_isShowTopSeparatorLine = 0

public extension UITableViewCell {
    
//    var isShowTopSeparatorLine: Bool {
//        get {
//            objc_getAssociatedObject(self, &Key_isShowTopSeparatorLine) as! Bool
//        }
//        set {
//            objc_setAssociatedObject(self, &Key_isShowTopSeparatorLine, newValue, .OBJC_ASSOCIATION_ASSIGN)
//            
//            if newValue {
//                if viewWithTag(10086) == nil {
//                    let separatorLine = UIView()
//                    separatorLine.backgroundColor = .lightGray
//                    separatorLine.tag = 10086
//                    addSubview(separatorLine)
//                    separatorLine.snp.makeConstraints { (make) in
//                        make.top.left.right.equalTo(self)
//                        make.height.equalTo(0.5)
//                    }
//                }
//            } else {
//                if let separatorLine = viewWithTag(10086) {
//                    separatorLine.removeFromSuperview()
//                }
//            }
//        }
//    }
}
