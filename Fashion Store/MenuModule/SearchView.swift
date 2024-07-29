//
//  SearchView.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 28.07.24.
//

import UIKit

class SearchView: UIView {
    
    enum ColorType {
        case transparent
        case dark
    }
    
    init(type: ColorType) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 5)
        configuration.baseForegroundColor = .white
        configuration.titleTextAttributesTransformer =
           UIConfigurationTextAttributesTransformer { incoming in
             var outgoing = incoming
               outgoing.font = UIFont.menuFont
             return outgoing
         }
        

        let button = UIButton(configuration: configuration)
        if type == .dark {
            backgroundColor = .black.withAlphaComponent(0.7)
            button.backgroundColor = .black
            button.layer.borderColor = UIColor.white.cgColor
        } else if type == .transparent {
            backgroundColor = .clear
            button.backgroundColor = .clear
            button.layer.borderColor = UIColor.label.cgColor
        }
        
        button.layer.borderWidth = 1
        button.titleLabel?.font = .menuFont
        button.setTitle("SEARCH", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        button.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
