//
//  SearchViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 30.07.24.
//

import UIKit

class SearchViewController: UITabBarController {
    
    // MARK: - Properties
    let clothesArray = ["TAILORED BLAZER", "HIGH-WAISTED TROUSERS", "RIBBED KNIT DRESS", "CROPPED DENIM JACKET", "WIDE-LEGGED PANTS", "TEXTURED CARDIGAN", "MIDI SKIRT", "CHUNKY SNEAKERS", "WOOL BERET", "PLAID SCARF", "V-NECK BLOUSE", "DOUBLE-BREASTED COAT", "PAPERBAG WAIST SHORTS", "BELTED TRENCH COAT", "MAXI DRESS", "FAUX FUR BATHROBE", "SLIP-ON SANDALS", "COMBAT BOOTS", "SILK TIE", "STRIPED SOCKS"]
    
    private var autoScrollTimer: Timer?
    private var displayLink: CADisplayLink?
    
    // MARK: - Subviews
    private let label: UILabel = {
        let label = UILabel()
        label.text = "What are you looking for?"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var searchField: UITextField = {
        let searchField = UITextField()
        searchField.font = .systemFont(ofSize: 22, weight: .semibold)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        return searchField
    }()
    
    private let suggestionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.register(SuggestionCollectionViewCell.self, forCellWithReuseIdentifier: SuggestionCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suggestionsCollectionView.delegate = self
        suggestionsCollectionView.dataSource = self
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startAutoScroll()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        view.addSubview(suggestionsCollectionView)
        view.addSubview(label)
        view.addSubview(searchField)
        
        tabBar.barStyle = .default
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            suggestionsCollectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            suggestionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suggestionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suggestionsCollectionView.heightAnchor.constraint(equalToConstant: 33),
            
            searchField.topAnchor.constraint(equalTo: suggestionsCollectionView.bottomAnchor, constant: 30),
            searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    // MARK: - Methods
    private func startAutoScroll() {
        stopAutoScroll()
        
        displayLink = CADisplayLink(target: self, selector: #selector(handleAutoScroll))
        displayLink?.add(to: .main, forMode: .common)
    }

    private func stopAutoScroll() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    
    // MARK: - Selectors
    @objc private func handleAutoScroll() {
        let currentOffset = suggestionsCollectionView.contentOffset.x
        let maxOffset = suggestionsCollectionView.contentSize.width - suggestionsCollectionView.bounds.width

        if currentOffset >= maxOffset {
            suggestionsCollectionView.setContentOffset(.zero, animated: false) // Instantly reset to start
        } else {
            suggestionsCollectionView.setContentOffset(CGPoint(x: currentOffset + 1, y: 0), animated: false) // Move smoothly
        }
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        clothesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionCollectionViewCell.identifier, for: indexPath) as? SuggestionCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: clothesArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = clothesArray[indexPath.item]
        let width = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 12)]).width + 20
        return CGSize(width: width, height: 33)
    }
}

