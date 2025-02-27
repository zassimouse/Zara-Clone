//
//  SuggestionCollectionViewCell.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 9.10.24.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: SuggestionCollectionViewCell.self)
    
    let suggestionLabel: UILabel = {
        let label = UILabel()
        label.font = .lightFont
        label.backgroundColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.borderWidth = 0.5
        
        addSubview(suggestionLabel)
        NSLayoutConstraint.activate([
            suggestionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            suggestionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with suggestion: String) {
        suggestionLabel.text = suggestion
    }
}
