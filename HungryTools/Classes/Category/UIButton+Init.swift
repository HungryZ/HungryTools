//
//  UIButton+Init.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

public extension UIButton {
    
    convenience init(title: String? = nil,
                     titleColor: UIColor? = nil,
                     font: Any? = nil,
                     cornerRadius: CGFloat? = nil,
                     backgroundColor: UIColor? = nil,
                     target: Any? = nil,
                     action: Selector? = nil) {
        
        self.init(type: .custom)
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        
        if font is Int {
            titleLabel?.font = .systemFont(ofSize: CGFloat(font as! Int))
        } else if font is Double {
            titleLabel?.font = .systemFont(ofSize: CGFloat(font as! Double))
        } else if font is CGFloat {
            titleLabel?.font = .systemFont(ofSize: font as! CGFloat)
        } else if font is UIFont {
            titleLabel?.font = font as? UIFont
        }
        
        if let radius = cornerRadius, radius > 0 {
            layer.cornerRadius = radius
        }
        self.backgroundColor = backgroundColor
        
        if target != nil && action != nil {
            addTarget(target, action: action!, for: .touchUpInside)
        }
    }
    
    convenience init(imageName: String, target: Any?, action: Selector) {
        
        self.init(type: .custom)
        
        setImage(UIImage(named: imageName), for: .normal)
        addTarget(target, action: action, for: .touchUpInside)
    }
    
}
