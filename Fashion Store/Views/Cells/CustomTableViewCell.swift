//
//  CustomTableViewCell.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 26.03.24.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didDeleteItemFromBasket(cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    // MARK: - Variables
    static let identifier = "CustomTableViewCell"
    
    // MARK: - UI Components
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    let verticalLine: UIView = {
        let v = UIView()
        v.backgroundColor = .label
        return v
    }()

    
    private let myLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .label
        lb.textAlignment = .left
        lb.font = .systemFont(ofSize: 24, weight: .medium)
        lb.text = "error"
        return lb
    }()
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "SLOGAN PRINT T-SHIRT"
        lb.font = .thinFont
        lb.textColor = .label
        return lb
    }()
    
    private let priceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "109.00 BYN"
        lb.font = .thinFont
        lb.textColor = .label
        return lb
    }()
    
    private let sizeAndColorLabel: UILabel = {
        let lb = UILabel()
        lb.text = "S | WHITE"
        lb.font = .thinFont
        lb.textColor = .label
        return lb
    }()
    
    private let deleteButton = IconButton(buttonType: .exit)
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        deleteButton.addTarget(self, action: #selector(removeItem), for: .touchUpInside)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage, label: String) {
        self.myImageView.image = image
        self.myLabel.text = label
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(deleteButton)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(sizeAndColorLabel)
        self.contentView.addSubview(verticalLine)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeAndColorLabel.translatesAutoresizingMaskIntoConstraints = false
        verticalLine.translatesAutoresizingMaskIntoConstraints = false
        
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
            verticalLine.widthAnchor.constraint(equalToConstant: 0.5)

        ])
    }
    
    // MARK: - Selectors
    
    @objc func removeItem() {
        self.delegate?.didDeleteItemFromBasket(cell: self)
    }
    

    
    

    
    

    

    

    
}
