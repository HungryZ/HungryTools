
//
//  UIImageView+Init.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/19.
//

public extension UIImageView {
    
    convenience init(imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
    
    convenience init(cornerRadius: CGFloat, clips: Bool = true, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init()
        layer.cornerRadius = cornerRadius
        clipsToBounds = clips
        self.contentMode = contentMode
    }
}
