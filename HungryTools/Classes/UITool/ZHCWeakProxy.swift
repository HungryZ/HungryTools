//
//  ZHCWeakProxy.swift
//  HungryTools
//
//  Created by 张海川 on 2021/3/5.
//

class ZHCWeakProxy: NSObject {
    
    weak var target: AnyObject?
    
    init(target: Any?) {
        self.target = target as AnyObject?
        super.init()
    }
    
    /// Fast forwarding 快速转发阶段（消息转发机制）
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        target
    }
}
