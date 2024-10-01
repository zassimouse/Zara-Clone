//
//  IconButton.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 26.03.24.
//

import UIKit

class IconButton: UIButton {
    
    enum ButtonType: String {
        case back = "arrow.left"
        case share = "square.and.arrow.up"
        case bookmark = "bookmark"
        case exit = "xmark"
        case minus = "minus"
        case plus = "plus"
    }

    init(buttonType: ButtonType) {
        super.init(frame: .zero)
        
        self.setImage(UIImage(systemName: buttonType.rawValue), for: .normal)
        self.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(font: .deleteButtonFont), forImageIn: .normal)
        self.backgroundColor = .clear
        self.tintColor = .label
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
