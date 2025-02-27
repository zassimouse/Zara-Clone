//
//  VerticalGalleryCollectionViewCell.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 27.07.24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ImageCollectionViewCell.self)
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
