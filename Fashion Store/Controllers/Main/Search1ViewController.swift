//
//  SearchViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class Search1ViewController: UIViewController {


    // MARK: - Variables
    private var items: [Item] = []
        
    // MARK: - UI Components
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.backgroundColor = .systemBackground
        
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        cv.alwaysBounceVertical = true
        
        return cv
        
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchData()
        self.setupUI()
                
    }
    
    public func configure(with items: [Item]) {
        self.items = items
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    // MARK: - Functions
    private func fetchData() {
        ItemService.shared.fetchAllItems { result in
            switch result {
            case.success(let titles):
                print(titles)
                print("titles")
                self.configure(with: titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension Search1ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // How many different CollectionViewCells we have
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    // This is where we crate the cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }

        if items.isEmpty {
            return UICollectionViewCell()
        }
        
        let model = items[indexPath.row]
        print(model)
        print("model\n")
        
        cell.configure(name: model.title, price: String(model.price), imageURL: model.imageURL)
        
        return cell
    }
}

extension Search1ViewController {
    
    // Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (self.view.frame.width / 2) - 4
        return CGSize(width: size, height: size * 1.5 + 36)
    }
    // Vertical Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    // Horizontal Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    

    
    // TODO: InsetForSectionAt 21:40
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.configure(with: items[indexPath.row])
        let nvc = UINavigationController(rootViewController: vc)        

        navigationController?.pushViewController(vc, animated: true)
    }
    
}



