//
//  BasketViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class BasketViewController: UIViewController {
    
    private var items: [Item] = []

    // MARK: - Variables
    private var images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
    ]
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.allowsSelection = false
        tv.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        return tv
    }()
    
    private let totalView = TotalView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //items = Basket.shared.loadItems()
        
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // to the end
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        
        tableView.separatorColor = .label
    }
    
    
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view.bringSubviewToFront(tableView)
//    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(totalView)
        totalView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            totalView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            totalView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            totalView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
//        self.view.bringSubviewToFront(totalView)
    }
    
    // MARK: - Selectors
    
}



extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.images.count
        
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath
        ) as? CustomTableViewCell else {
            fatalError("table view could not dequeue custom cell")
        }
        
        //let image = self.images[indexPath.row]
        cell.configure(with: images[1], label: "T-SHIRT DECORATED")
    
        
        cell.delegate = self
        
        cell.layoutMargins = UIEdgeInsets.zero

        return cell
    }
    
}

extension BasketViewController: CustomTableViewCellDelegate {
    func didDeleteItemFromBasket(cell: CustomTableViewCell) {
        print("delegate works")
        images.remove(at: 0)
        let indexPath = IndexPath(item: 0, section: 0)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
   
    
}
