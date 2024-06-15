//
//  CloseButton.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 16.03.24.
//

import UIKit

class CloseButton: UIButton {

    init() {
        super.init(frame: .zero)
        
        self.titleLabel?.font = .thinFont
        self.setImage(UIImage(systemName: "xmark"), for: .normal)
        self.backgroundColor = .clear
        self.tintColor = .label
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
