//
//  UILabel+Init.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

public extension UILabel {
    
    convenience init(font: Any = 14, textColor: UIColor? = nil, text: String? = nil) {
        self.init()
        
        if font is Int {
            self.font = .systemFont(ofSize: CGFloat(font as! Int))
        } else if font is Double {
            self.font = .systemFont(ofSize: CGFloat(font as! Double))
        } else if font is CGFloat {
            self.font = .systemFont(ofSize: font as! CGFloat)
        } else if font is UIFont {
            self.font = font as? UIFont
        }
        
        
        if let color = textColor {
            self.textColor = color
        }
        self.text = text
    }
    
    /// 等宽字体
    convenience init(MonospacedFontSize size: CGFloat) {
        self.init()
        font = UIFont(name: "Helvetica Neue", size: size)
    }
}
