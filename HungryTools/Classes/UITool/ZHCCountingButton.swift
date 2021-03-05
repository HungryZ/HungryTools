//
//  ZHCCountingButton.swift
//  HungryTools
//
//  Created by 张海川 on 2019/12/21.
//

import UIKit

public class ZHCCountingButton: UIButton {
    
    public enum CountingStatus {
        /// 未触发倒计时状态
        case normal
        /// 正在倒计时
        case counting
        /// 倒计时结束
        case recovered
    }
    
    /// 用于防重置处理
    static var allStamps: [String : TimeInterval]?
    
    public var countingStatus: CountingStatus = .normal
    
    public let recoveredTitle: String
    
    public let countingTitle: String
    
    /// 用于防重置标记，每个按钮不同
    public var stamp: String?
    
    private let countingSeconds: Int
    
    private var nowSeconds: Int
    
    private var timer: Timer?
    
    deinit {
        timer?.invalidate()
    }
    
    public init(normalTitle: String,
                countingTitle: String,
                recoveredTitle: String,
                normalTitleColor: UIColor,
                countingTitleColor: UIColor,
                normalBackgroundColor: UIColor? = nil,
                countingBackgroundColor: UIColor? = nil,
                fontSize: CGFloat,
                countingSeconds: Int,
                stamp: String? = nil) {
        
        self.countingTitle = countingTitle
        self.recoveredTitle = recoveredTitle
        self.nowSeconds = countingSeconds
        self.countingSeconds = countingSeconds
        self.stamp = stamp
        
        super.init(frame: .zero)
        
        titleLabel?.font = UIFont(name: "Helvetica Neue", size: fontSize)   // 等宽字体
        setTitleColor(normalTitleColor, for: .normal)
        setTitleColor(countingTitleColor, for: .disabled)
        if let norBGColor = normalBackgroundColor {
            setBackgroundImage(UIImage.image(color: norBGColor), for: .normal)
        }
        if let disBGColor = countingBackgroundColor {
            setBackgroundImage(UIImage.image(color: disBGColor), for: .disabled)
        }
        
        setTitle(normalTitle, for: .normal)
        
        // 防重置
        if let stamp = stamp, let interval = ZHCCountingButton.allStamps?[stamp] {
            let speedSeconds = Int(Date().timeIntervalSince1970 - interval)
            let leftSeconds = countingSeconds - speedSeconds
            if leftSeconds > 0 {
                nowSeconds = leftSeconds
                startCounting()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startCounting () {
        
        countingStatus = .counting
        isEnabled = false
        
        if let stamp = stamp, nowSeconds == countingSeconds {
            if ZHCCountingButton.allStamps == nil {
                ZHCCountingButton.allStamps = [String : TimeInterval]()
            }
            ZHCCountingButton.allStamps![stamp] = Date().timeIntervalSince1970
        }
        
        let weakProxy = ZHCWeakProxy(target: self)
        timer = Timer.scheduledTimer(timeInterval: 1, target: weakProxy, selector: #selector(countingEvent), userInfo: nil, repeats: true)
        timer!.fireDate = Date()
        
    }
    
    @objc func countingEvent() {
        nowSeconds -= 1
        if nowSeconds == 0 {
            // 计时结束，重置时间
            nowSeconds = countingSeconds
            timer?.invalidate()
            timer = nil
            
            isEnabled = true
            setTitle(recoveredTitle, for: .normal)
            
            if let stamp = stamp {
                ZHCCountingButton.allStamps?.removeValue(forKey: stamp)
                if ZHCCountingButton.allStamps?.isEmpty ?? false {
                    ZHCCountingButton.allStamps = nil
                }
            }
            
            return
        }
        
        setTitle(String(format: countingTitle, nowSeconds), for: .disabled)
    }
    
}
