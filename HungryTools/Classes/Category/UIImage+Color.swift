//
//  UIImage+Color.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

public extension UIImage {
    
    static func image(color: UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()!;
        context.setFillColor(color.cgColor);
        context.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!;

        UIGraphicsEndImageContext();
        
        return image
    }
}
