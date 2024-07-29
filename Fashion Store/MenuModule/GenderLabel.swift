//
//  GenderLabel.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 28.07.24.
//

import UIKit

class GenderLabel: UILabel {
    
    init(with text: String) {
        super.init(frame: .zero)
        self.text = text
        textColor = .label
        font = .systemFont(ofSize: 17)
    }
    
    func onBold() {
        font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    func offBold() {
        font = .systemFont(ofSize: 17)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
