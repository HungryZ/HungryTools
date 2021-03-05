//
//  ZHCTextField.swift
//  HungryTools
//
//  Created by 张海川 on 2019/12/25.
//

import UIKit

class ZHCTextField: UITextField {
    
    enum TextFieldType {
        case normal
        case number
        case phoneNumber
        case phoneNumberWithoutSpacing
        case password
        case money
        case idCardNumber
        case chinese
        case bankCardNumber
    }
    
    var fieldType = TextFieldType.normal {
        didSet {
            switch fieldType {
            case .normal:
                break
            case .number:
                keyboardType = .numberPad
            case .phoneNumber:
                keyboardType = .phonePad
                maxLength = 13
            case .phoneNumberWithoutSpacing:
                keyboardType = .phonePad
                maxLength = 11
            case .password:
                isSecureTextEntry = true
                rightView = secureView
                rightViewMode = .always
                keyboardType = .alphabet
                maxLength = 18
            case .money:
                keyboardType = .decimalPad
                maxLength = 8
            case .idCardNumber:
                maxLength = 18
            case .chinese:
                break
            case .bankCardNumber:
                keyboardType = .numberPad
                maxLength = 19
            }
        }
    }
    /// 删除空格后的手机号码，在 ANFieldType 为 ANFieldTypePhoneNumber 时有效。
    var phoneNumberString: String? {
        get {
            if fieldType == .phoneNumber {
                return text?.replacingOccurrences(of: " ", with: "")
            } else {
                return nil
            }
        }
    }
    /// 文本长度限制
    var maxLength = 0
    /// 左视图文字颜色，需在leftText之前赋值
    var leftTextColor: UIColor?
    /// 左视图文字颜色，需在leftText之前赋值
    var leftTextFontSize: CGFloat = 14
    
    
    
    var leftText: String? {
        didSet {
            let label = UILabel(font: leftTextFontSize, text: leftText)
            if leftTextColor != nil {
                label.textColor = leftTextColor!
            }
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: label.textWidth() + 21, height: bounds.size.height))
            
            leftView.addSubview(label)
            leftView.addConstraints([
                NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: leftView, attribute: .centerY, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: leftView, attribute: .left, multiplier: 1, constant: 10),
                NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal, toItem: leftView, attribute: .right, multiplier: 1, constant: -10),
            ])
            
            self.leftView = leftView
            leftViewMode = .always
        }
    }
    
    var leftImageName: String? {
        didSet {
            guard leftImageName != nil else { return }
            guard let image = UIImage(named: leftImageName!) else { return }
            let subView = UIImageView(image: image)
            
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + 20, height: bounds.size.height))
            
            leftView.addSubview(subView)
            leftView.addConstraints([
                NSLayoutConstraint(item: subView, attribute: .centerY, relatedBy: .equal, toItem: leftView, attribute: .centerY, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: subView, attribute: .left, relatedBy: .equal, toItem: leftView, attribute: .left, multiplier: 1, constant: 10),
                NSLayoutConstraint(item: subView, attribute: .right, relatedBy: .equal, toItem: leftView, attribute: .right, multiplier: 1, constant: -10),
            ])
            
            self.leftView = leftView
            leftViewMode = .always
        }
    }
    
    

    /// 密码明暗文切换图片数组，需包含两个UIImage，第一个代表明文，第二个代表暗文。
    var secureButtonImages: [UIImage]? {
        didSet {
            guard secureButtonImages?.count == 2 else { return }
            secureButton.setImage(secureButtonImages![0], for: .selected)
            secureButton.setImage(secureButtonImages![1], for: .normal)
        }
    }
    /// clearButton 按钮图片
    var clearButtonImage: UIImage? {
        didSet {
            let button =  value(forKey: "_clearButton") as! UIButton
            button.setImage(clearButtonImage, for: .normal)
        }
    }
    
    
    
    var showBottomLine = true {
        didSet {
            bottomLineView.isHidden = !showBottomLine
        }
    }
    /// 正在输入时下划线颜色
    var bottomLineActiveColor = UIColor.purple
    /// 失去焦点时下划线颜色
    var bottomLinePassiveColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1) {
        didSet {
            bottomLineView.backgroundColor = bottomLinePassiveColor
        }
    }
    /// 下划线高度，默认0.5
    var bottomLineHeight: CGFloat = 0.5 {
        didSet {
            removeConstraints(bottomLineView.constraints)
            let margin: CGFloat = isContainLeftOrRightView ? 10 : 0
            addConstraints([
                NSLayoutConstraint(item: bottomLineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: margin),
                NSLayoutConstraint(item: bottomLineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: bottomLineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: margin),
                NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: bottomLineHeight),
            ])
        }
    }
    
    
    
    var placeholderColor: UIColor? {
        didSet {
            setPlaceHolderAttribute(value: placeholderColor!)
        }
    }
    var placeholderFont: UIFont? {
        didSet {
            setPlaceHolderAttribute(value: placeholderFont!)
        }
    }
    override var placeholder: String? {
        didSet {
            if placeholderColor != nil {
                setPlaceHolderAttribute(value: placeholderColor!)
            }
            if placeholderFont != nil {
                setPlaceHolderAttribute(value: placeholderFont!)
            }
        }
    }
    
    
    
    private lazy var bottomLineView = UIView(backgroundColor: bottomLinePassiveColor)
    
    private lazy var secureView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 30))
        
        secureButton.frame = CGRect(x: 10, y: 0, width: 44, height: 30)
        view.addSubview(secureButton)
        
        return view
    }()
    
    private lazy var secureButton: UIButton = {
        let button = UIButton(imageName: "icon_mmbkj_24", target: self, action: #selector(secureBtnClicked))
        button.setImage(UIImage(named: "icon_mmkj_24"), for: .selected)
        
        return button
    }()
    
    private var isContainLeftOrRightView = false
    
    override var leftView: UIView? {
        didSet {
            updateBottomLineConstraints()
        }
    }
    
    override var rightView: UIView? {
        didSet {
            updateBottomLineConstraints()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initConfig()
        paiConfig()
    }
    
    fileprivate func initConfig() {
        clearButtonMode = .whileEditing
        delegate = self
        font = .systemFont(ofSize: 14)
        
        addBottomLine()
    }
    
    // MARK: - Click Event
    @objc func secureBtnClicked() {
        isSecureTextEntry = !isSecureTextEntry
        secureButton.isSelected = !isSecureTextEntry
    }
    
    // MARK: - Private
    private func addBottomLine() {
        addSubview(bottomLineView)
        addConstraints([
            NSLayoutConstraint(item: bottomLineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomLineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomLineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: bottomLineHeight)
        ])
    }
    
    private func updateBottomLineConstraints() {
        
        isContainLeftOrRightView = true
    
        removeConstraints(bottomLineView.constraints)
        addConstraints([
            NSLayoutConstraint(item: bottomLineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: bottomLineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bottomLineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: bottomLineHeight)
        ])
    }
    
    private func setPlaceHolderAttribute(value: Any) {
        
        guard attributedPlaceholder != nil else {
            return
        }
        
        let attriString = NSMutableAttributedString(attributedString: attributedPlaceholder!)
        
        var name = NSAttributedString.Key.font
        if value is UIFont {
            name = .font
        } else if value is UIColor {
            name = .foregroundColor
        }
        attriString.addAttribute(name, value: value, range: NSRange(location: 0, length: attributedPlaceholder!.length))
        
        attributedPlaceholder = attriString
    }
        
}

extension ZHCTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 删除
        if string == "" {
            return true
        }
        
        let comingTextLength = (textField.text?.count ?? 0) + string.count - range.length
        if maxLength > 0 && comingTextLength > maxLength {
            return false
        }
        
        switch fieldType {
        case .normal:
            return true
        case .number:
            return string.checkWithRegexString(regex: "[0-9]+")
        case .phoneNumber:
            if textField.text?.count == 3 || textField.text?.count == 8 {
                textField.text?.insert(" ", at: textField.text!.endIndex)
            }
            return string.checkWithRegexString(regex: "[0-9]+")
        case .phoneNumberWithoutSpacing:
            return string.checkWithRegexString(regex: "[0-9]+")
        case .password:
            return string.checkWithRegexString(regex: "[\\x00-\\xff]+") // 半角字符 包括字母，数字，标点符号
        case .money:
            return string.checkWithRegexString(regex: "[0-9.]+")
        case .idCardNumber:
            return string.checkWithRegexString(regex: "[0-9Xx]+")
        case .chinese:
            return string.checkWithRegexString(regex: "[a-z\\u4e00-\\u9fa5]+")
        case .bankCardNumber:
            return string.checkWithRegexString(regex: "[0-9]+")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25) {
            self.bottomLineView.backgroundColor = self.bottomLineActiveColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25) {
            self.bottomLineView.backgroundColor = self.bottomLinePassiveColor
        }
    }
}

extension ZHCTextField {
    
    static func paiStyleField() -> ZHCTextField {
        let field = self.init()
        field.showBottomLine = false
        field.placeholderFont = .systemFont(ofSize: 18)
        field.placeholderColor = .lightGray
        field.font = .systemFont(ofSize: 18)
        field.backgroundColor = .white
        field.layer.cornerRadius = 2
        
        return field
    }
    
    func paiConfig() {
        showBottomLine = false
        placeholderFont = .systemFont(ofSize: 18)
        placeholderColor = .lightGray
        font = .systemFont(ofSize: 18)
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 2
    }
}
