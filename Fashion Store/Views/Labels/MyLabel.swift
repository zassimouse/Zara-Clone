//
//  CustomLabel.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 16.03.24.
//

import UIKit

class MyLabel: UILabel {
        
    init(text: String, isSmall: Bool = false) {
        super.init(frame: .zero)
        self.font = isSmall ? .smallLabelFont : .largeLabelFont
        self.text = isSmall ? text : text.uppercased()
        self.textAlignment = .left
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
