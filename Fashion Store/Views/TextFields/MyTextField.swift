//
//  MyTextField.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 14.03.24.
//

import UIKit

// uses
class MyTextField: UITextField {
    
    enum TextFieldType {
        case name
        case email
        case password
    }
    
    private let fieldType: TextFieldType
    
    init(fieldType: TextFieldType) {
        self.fieldType = fieldType
        
        super.init(frame: .zero)
                
        self.backgroundColor = .systemBackground
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
//        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: frame.size.height))
        
        self.font = .lightFont
        
        switch fieldType {
        case .name:
            self.placeholder = "NAME"
        case .email:
            self.placeholder = "EMAIL"
            self.keyboardType = .emailAddress
        case .password:
            self.placeholder = "PASSWORD"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let border = CAShapeLayer()

    override func layoutSubviews() {
        super.layoutSubviews()
        useUnderline()
    }

    func useUnderline(){
        if layer.sublayers?.contains(border) ?? false{
            border.removeFromSuperlayer()
        }
        border.path = UIBezierPath.init(rect: CGRect.init(x: 0, y: self.bounds.height - 0.5, width: self.bounds.width, height: 0.5)).cgPath
        border.fillColor = UIColor.systemGray4.cgColor
        self.layer.insertSublayer(border, at: 10)

    }
    
}
