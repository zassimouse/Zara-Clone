//
//  DetailSheetViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 8.10.24.
//

import UIKit

class DetailSheetViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .lightFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addToCartButton = BorderedButton(title: "ADD TO CART", font: .buttonFont)
    
    func configure(with item: Item) {
        titleLabel.text = item.title
        priceLabel.text = String(item.price) + "BYN"
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        view.backgroundColor = UIColor(named: "constantSystemColor")

        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(addToCartButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            priceLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            addToCartButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            addToCartButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            addToCartButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            addToCartButton.heightAnchor.constraint(equalToConstant: 33),
        ])
    }

}
