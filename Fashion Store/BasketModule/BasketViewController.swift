//
//  BasketViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class BasketViewController: UIViewController {
    
    // MARK: - Variables
    private var images: [UIImage] = [
        UIImage(named: "3")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
    ]
    
    private var items: [Item] = [
        Item(id: "aaa", title: "LINEN SHIRT", price: "120.00", imageURL: "https://static.zara.net/assets/public/4585/a10b/999a4cbb98d1/e37434d49e8c/05743531427-p/05743531427-p.jpg?ts=1720001437714&w=850"),
        Item(id: "aaa", title: "LINEN SHIRT", price: "120.00", imageURL: "https://static.zara.net/assets/public/4585/a10b/999a4cbb98d1/e37434d49e8c/05743531427-p/05743531427-p.jpg?ts=1720001437714&w=850"),
    ]

    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
        
    private let totalView = TotalView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // to the end
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = .label
        
        self.setupUI()
    }
    

    // MARK: - UI Setup
    private func setupUI() {
        
        self.view.backgroundColor = .systemBackground
        
        totalView.addViewBackedBorder(side: .top, thickness: 0.5, color: .label)
            
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
        
    }
    
    // MARK: - Selectors
    
}



extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath
        ) as? CustomTableViewCell else {
            fatalError("table view could not dequeue custom cell")
        }
        
        cell.configure(with: UIImage(named: "1")!, label: "HE AER T-SHIRT", indexPath: indexPath)
        cell.delegate = self
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }
    
}

extension BasketViewController: CustomTableViewCellDelegate {
    func didIncreaseQuantity(cell: CustomTableViewCell) {
         
    }
    
    func didDecreaseQuantity(cell: CustomTableViewCell) {
         
    }
    
    func didDeleteItemFromBasket(cell: CustomTableViewCell) {
        print("\n\ndelegate works\n\n\n\n")
        print(cell.indexPath.row)
//        images.remove(at: cell.indexPath.row)
        tableView.deleteRows(at: [cell.indexPath], with: .left)
    }
}
