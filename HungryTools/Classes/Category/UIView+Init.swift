//
//  UIView+Init.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

public extension UIView {

    convenience init(backgroundColor: UIColor, radius: CGFloat = 0, frame: CGRect = .zero) {
        self.init()
        self.frame = frame
        self.backgroundColor = backgroundColor
        if radius > 0 {
            layer.cornerRadius = radius
        }
    }
}
