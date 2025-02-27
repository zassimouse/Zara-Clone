//
//  CustomTableViewCell.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 26.03.24.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didDeleteItemFromBasket(cell: CustomTableViewCell)
    func didIncreaseQuantity(cell: CustomTableViewCell)
    func didDecreaseQuantity(cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
        
    // MARK: - Variables
    weak var delegate: CustomTableViewCellDelegate?

    static let identifier = "CustomTableViewCell"
    
    var indexPath: IndexPath!
    
    // MARK: - UI Components
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
        return imageView
    }()
    
    let verticalLine: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        return view
    }()

    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "SLOGAN PRINT T-SHIRT"
        label.font = .thinFont
        label.textColor = .label
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "109.00 BYN"
        label.font = .thinFont
        label.textColor = .label
        return label
    }()
    
    private let sizeAndColorLabel: UILabel = {
        let label = UILabel()
        label.text = "S | WHITE"
        label.font = .thinFont
        label.textColor = .label
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.layer.borderColor = UIColor.label.cgColor
        label.layer.borderWidth = 0.5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let deleteButton = IconButton(buttonType: .exit)
    private let decreaseButton = IconButton(buttonType: .minus)
    private let increaseButton = IconButton(buttonType: .plus)
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        deleteButton.addTarget(self, action: #selector(removeItem), for: .touchUpInside)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage, label: String, indexPath: IndexPath) {
        self.indexPath = indexPath
        self.myImageView.image = image
        self.myLabel.text = label
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        decreaseButton.layer.borderColor = UIColor.label.cgColor
        decreaseButton.layer.borderWidth = 0.5
        
        increaseButton.layer.borderColor = UIColor.label.cgColor
        increaseButton.layer.borderWidth = 0.5
        
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(deleteButton)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(sizeAndColorLabel)
        self.contentView.addSubview(verticalLine)
        
        self.contentView.addSubview(decreaseButton)
        self.contentView.addSubview(increaseButton)
        self.contentView.addSubview(quantityLabel)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeAndColorLabel.translatesAutoresizingMaskIntoConstraints = false
        verticalLine.translatesAutoresizingMaskIntoConstraints = false
        
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            myImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5),
            myImageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.75),
            
            deleteButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            deleteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            
            sizeAndColorLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            sizeAndColorLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            
            verticalLine.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            verticalLine.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            verticalLine.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor),
            verticalLine.widthAnchor.constraint(equalToConstant: 0.5),
            
            decreaseButton.leadingAnchor.constraint(equalTo: verticalLine.trailingAnchor, constant: 10),
            decreaseButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            decreaseButton.widthAnchor.constraint(equalToConstant: 35),
            decreaseButton.heightAnchor.constraint(equalToConstant: 35),
            
            quantityLabel.leadingAnchor.constraint(equalTo: decreaseButton.trailingAnchor, constant: -1),
            quantityLabel.bottomAnchor.constraint(equalTo: decreaseButton.bottomAnchor),
            quantityLabel.widthAnchor.constraint(equalToConstant: 35),
            quantityLabel.heightAnchor.constraint(equalToConstant: 35),
            
            increaseButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: -1),
            increaseButton.bottomAnchor.constraint(equalTo: quantityLabel.bottomAnchor),
            increaseButton.widthAnchor.constraint(equalToConstant: 35),
            increaseButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    // MARK: - Selectors
    @objc func removeItem() {
        self.delegate?.didDeleteItemFromBasket(cell: self)
    }
}
