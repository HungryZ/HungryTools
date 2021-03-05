//
//  UIImage+Chameleon.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

public extension UIImage {
    
    enum DirectionType {
        /// 从上到下
        case topToBottom
        /// 从左到右
        case leftToRight
        /// 左上到右下
        case upleftToLowright
        /// 右上到左下
        case uprightToLowleft
        case custom(startPoint: CGPoint, endPoint: CGPoint)
    }
    
    /// 生成渐变色图片，默认方向从左到右
    static func image(colors: [UIColor],
                      direction: DirectionType? = .leftToRight,
                      size: CGSize? = CGSize(width: 1, height: 1)) -> UIImage {
        
        let startPoint, endPoint: CGPoint
        
        switch direction! {
        case .topToBottom:
            startPoint = CGPoint(x: 0.5, y: 0)
            endPoint   = CGPoint(x: 0.5, y: 1)
        case .leftToRight:
            startPoint = CGPoint(x: 0, y: 0.5)
            endPoint   = CGPoint(x: 1, y: 0.5)
        case .upleftToLowright:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint   = CGPoint(x: 1, y: 1)
        case .uprightToLowleft:
            startPoint = CGPoint(x: 1, y: 0)
            endPoint   = CGPoint(x: 0, y: 1)
        case let .custom(sPoint, ePoint):
            startPoint = sPoint
            endPoint = ePoint
        }
        
        let layer = CAGradientLayer()
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        layer.colors = [colors[0].cgColor, colors[1].cgColor]
        layer.frame = CGRect(x: 0, y: 0, width: size!.width, height: size!.height)
        layer.locations = [0, 1]
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, layer.isOpaque, 0.0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
