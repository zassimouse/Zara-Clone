//
//  MenuViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 28.07.24.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Subviews
    private let genderView = GenderView()
    
    private let categories = Categories()
    
    private let searchView = SearchView(type: .dark)

    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        collectionView.bounces = false
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        view.addSubview(genderView)
        view.addSubview(searchView)
        NSLayoutConstraint.activate([
            
            genderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            genderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            genderView.topAnchor.constraint(equalTo: self.view.topAnchor),
            genderView.heightAnchor.constraint(equalToConstant: 200),
            
            collectionView.topAnchor.constraint(equalTo: genderView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            
            searchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 70),
        ])

    }
    
    // MARK: - SetupUI
    
    // MARK: - Methods
    
    
    // MARK: - Selectors
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
        if indexPath.row == 0 {
            cell.configure(with: categories.woman)
        } else if indexPath.row == 1 {
            cell.configure(with: categories.man)
        } else if indexPath.row == 2 {
            cell.configure(with: categories.kids)
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / width)
        genderView.selectItem(at: currentPage)
    }
}
