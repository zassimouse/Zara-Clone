//
//  InfoView.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 31.03.24.
//

import UIKit

class InfoView: UIView {

    // MARK: - Variables
    
    // MARK: - UI Components
    let addButton = NakedButton(title: "add", font: .boldFont)
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
//        lb.text = "Jeans"
        lb.font = .thinFont
        return lb
    }()
    
    private let priceLabel: UILabel = {
        let lb = UILabel()
//        lb.text = "Jeans"
        lb.font = .thinFont
        return lb
    }()
    

    
    // MARK: - LifeCycle
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.backgroundColor = .systemBackground
        
        self.addSubview(addButton)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        
        self.layoutIfNeeded()
                
                // Add top and bottom borders to the button
        addButton.addTopAndBottomBorders(with: .red, andWidth: 2.0)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.topAnchor),
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 33),
            
            titleLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),

        ])
    }
    
    public func configure(with item: Item) {
        titleLabel.text = item.title
        priceLabel.text = item.price
        s = item.id
    }
    
    private var s: String = ""
    
    // MARK: - Selectors
    @objc func addToCart() {
        addButton.setTitle("ADDED", for: .normal)
        Basket.shared.addItem(basketItem: BasketItem(id: self.s, quantity: 1))
    }


}
