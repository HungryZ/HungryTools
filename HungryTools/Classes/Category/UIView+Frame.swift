//
//  UIView+Frame.swift
//  HungryTools
//
//  Created by 张海川 on 2019/11/15.
//

public extension UIView {
    
    var top: CGFloat {
        get {
            frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var left: CGFloat {
        get {
            frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var bottom: CGFloat {
        get {
            frame.origin.y + frame.size.height
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right: CGFloat {
        get {
            frame.origin.x + frame.size.width
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get {
            center.x
        }
        set {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            center.y
        }
        set {
            center = CGPoint(x: center.x, y: newValue)
        }
    }
    
    var width: CGFloat {
        get {
            frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get {
            frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
}
