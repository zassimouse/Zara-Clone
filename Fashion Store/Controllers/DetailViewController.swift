//
//  TestViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 16.03.24.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .systemBackground
        return sv
    }()
    
    private var contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        return v
    }()
    
    private var imageViews: [UIImageView] = {
        var imageViews: [UIImageView] = []
        for x in 1...5 {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
//            iv.image = UIImage(named: x.description)
            imageViews.append(iv)
        }
        return imageViews
    }()
    
    private let colorView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        return v
    }()

    private let infoView = InfoView()
    
    private let backButton = IconButton(buttonType: .back)
    private let shareButton = IconButton(buttonType: .share)
    private let bookMarkButton = IconButton(buttonType: .bookmark)
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.addTarget(self , action: #selector(goBack), for: .touchUpInside)
        
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: shareButton),
            UIBarButtonItem(customView: bookMarkButton)
        ]
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    public func configure(with item: Item) {
        
        guard let url = URL(string: item.imageURL) else {
            return
        }
        
        imageViews[0].sd_setImage(with: url)
        imageViews[1].sd_setImage(with: url)
        imageViews[2].sd_setImage(with: url)
        imageViews[3].sd_setImage(with: url)
        imageViews[4].sd_setImage(with: url)
        
        infoView.configure(with: item)

    }

   
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(scrollView)
        self.view.addSubview(infoView)
        self.scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
//        let hConst = contentView.heightAnchor.constraint(equalToConstant: 200)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -200),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            infoView.heightAnchor.constraint(equalToConstant: 200),
            infoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.view.addSubview(imageViews[0])
        self.view.addSubview(imageViews[1])
        self.view.addSubview(imageViews[2])
        self.view.addSubview(imageViews[3])
        self.view.addSubview(imageViews[4])
        
        imageViews[0].translatesAutoresizingMaskIntoConstraints = false
        imageViews[1].translatesAutoresizingMaskIntoConstraints = false
        imageViews[2].translatesAutoresizingMaskIntoConstraints = false
        imageViews[3].translatesAutoresizingMaskIntoConstraints = false
        imageViews[4].translatesAutoresizingMaskIntoConstraints = false

        
    
        NSLayoutConstraint.activate([
            imageViews[0].topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageViews[0].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageViews[0].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageViews[0].heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.5),
            imageViews[0].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            imageViews[1].topAnchor.constraint(equalTo: self.imageViews[0].bottomAnchor),
            imageViews[1].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageViews[1].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageViews[1].heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.5),
            imageViews[1].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            imageViews[2].topAnchor.constraint(equalTo: self.imageViews[1].bottomAnchor),
            imageViews[2].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageViews[2].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageViews[2].heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.5),
            imageViews[2].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            imageViews[3].topAnchor.constraint(equalTo: self.imageViews[2].bottomAnchor),
            imageViews[3].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageViews[3].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageViews[3].heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.5),
            imageViews[3].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            imageViews[4].topAnchor.constraint(equalTo: self.imageViews[3].bottomAnchor),
            imageViews[4].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageViews[4].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageViews[4].heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.5),
            imageViews[4].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            self.imageViews[4].bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            

        ])
        
        self.view.bringSubviewToFront(infoView)
        
    }
    
    // MARK: - Selectors
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
