//
//  UILabel+Size.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

public extension UILabel {
    /// 单行文本宽度
    func textWidth() -> CGFloat {
        
        if numberOfLines == 0 {
            return bounds.size.width
        }
        
        return text?.size(withAttributes: [.font: font ?? UIFont.systemFont(ofSize: 17)]).width ?? 0
    }
    /// 多行普通文本高度
    func textHeightWithWidth(width: CGFloat) -> CGFloat {
        
        guard let textString = text as NSString? else { return 0 }
        
        return textString.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
                                       options: .usesLineFragmentOrigin,
                                       attributes: [.font: font ?? 17],
                                       context: nil).size.height
    }
    /// 多行富文本高度（需先赋值 attributedText 属性）
    func attributedTextHeightWithWidth(width: CGFloat) -> CGFloat {
        guard let attri = attributedText else { return 0 }
        
        return attri.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
                                  options: [.usesLineFragmentOrigin, .usesFontLeading],
                                  context: nil).size.height
    }
}
