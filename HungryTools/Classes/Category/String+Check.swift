//
//  String+Check.swift
//  HungryTools
//
//  Created by 张海川 on 2019/10/30.
//

import CommonCrypto

public extension String {
    
    func checkWithRegexString(regex: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    func MD5() -> String {
        let str = (self as NSString).cString(using: String.Encoding.utf8.rawValue)
        let strLen = CUnsignedInt((self as NSString).lengthOfBytes(using: String.Encoding.utf8.rawValue))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count: 16)
        
        return hash as String
    }
    
    func isPhoneNumber() -> Bool {
        checkWithRegexString(regex: "^1[3-9]\\d{9}$")
    }
    
    func isPassword() -> Bool {
        checkWithRegexString(regex: "^(?=.*\\d)(?=.*[A-Za-z]).{6,18}$")
    }
    
    func phoneFormat() -> String {
        if !self.isPhoneNumber() {
            return ""
        }
        
        let index2 = self.index(self.startIndex, offsetBy: 3)
        let index6 = self.index(self.startIndex, offsetBy: 7)
        
        let str1 = String(self.prefix(upTo: index2))
        let str2 = String(self[index2 ..< index6])
        let str3 = String(self.suffix(from: index6))
        
        return str1 + " " + str2 + " " + str3
    }
    
    /// 获取字符串字符数字
    func charactersCount() -> UInt {
        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
        let da = self.data(using: String.Encoding.init(rawValue: enc))
        
        return UInt(da?.count ?? 0)
    }
}
