//
//  UIImage+Compress.swift
//  HungryTools
//
//  Created by 张海川 on 2019/12/5.
//

public extension UIImage {
    
    /// 压缩图片质量，如果图片太大压缩不到目标大小，则减小尺寸重绘再压缩
    func compressImage(aimMB: CGFloat) -> Data {
        
        let aimBytes = Int(aimMB * 1024 * 1024)
        
        var max: CGFloat = 1
        var min: CGFloat = 0
        
        var data = UIImageJPEGRepresentation(self, 1)!
//        print("原始图片大小：\(CGFloat(data.count) / 1024 / 1024)MB")
        if data.count < aimBytes {
            return data
        }
        
        for _ in 0..<6 {
            let quality = (min + max) / 2
            data = UIImageJPEGRepresentation(self, quality)!
//            print("第\(i + 1)次压缩，比例：\(quality)，图片大小：\(CGFloat(data.count) / 1024 / 1024)MB")
            if data.count > aimBytes {
                max = quality
            } else if data.count < Int(CGFloat(aimBytes) * 0.9) {
                min = quality
            } else {
                break
            }
        }
        
        if data.count <= aimBytes {
            return data
        }
        
        var newImage = self
        print("宽：\(newImage.size.width)高：\(newImage.size.height)")
        while data.count > aimBytes {
            let ratio = CGFloat(aimBytes) / CGFloat(data.count)
            let rect = CGRect(x: 0,
                              y: 0,
                              width: Int(newImage.size.width * sqrt(ratio)),
                              height: Int(newImage.size.height * sqrt(ratio)))
            UIGraphicsBeginImageContext(rect.size)
            newImage.draw(in: rect)
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            data = UIImageJPEGRepresentation(self, (min + max) / 2)!
//            print("缩小尺寸，比例：\(ratio)，图片大小：\(CGFloat(data.count) / 1024 / 1024)MB，宽：\(rect.size.width)高：\(rect.size.height)")
        }
        
        return data
    }
}
