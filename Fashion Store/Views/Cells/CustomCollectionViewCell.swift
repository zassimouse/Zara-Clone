//
//  CustomCollectionViewCell.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 15.03.24.
//

import UIKit
import SDWebImage

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "question")
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let lb = UILabel()
        lb.font = .thinFont
        lb.textColor = .label
        return lb
    }()
    
    private let priceLabel: UILabel = {
        let lb = UILabel()
        lb.font = .thinFont
        lb.textColor = .label
        return lb
    }()
    
    public func configure(name: String, price: String, imageURL: String) {
        self.nameLabel.text = name
        self.priceLabel.text = price
        guard let url = URL(string: imageURL) else {
            return
        }
        
        myImageView.sd_setImage(with: url)
        self.setupUI()
    }
    
    private func setupUI() {
        
      
        print("@@@@@@@@@@@@@@@@")
        self.backgroundColor = .systemBackground
        
        self.addSubview(myImageView)
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
        
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myImageView.heightAnchor.constraint(equalTo: myImageView.widthAnchor, multiplier: 1.5),
            
            nameLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }
}
