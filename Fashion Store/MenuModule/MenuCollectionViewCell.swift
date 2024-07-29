//
//  MenuCollectionViewCell.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 28.07.24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: MenuCollectionViewCell.self)
    
    var categories: [String] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layoutMargins = .init(top: 0.0, left: 35, bottom: 0.0, right: 0.5)
        tableView.showsVerticalScrollIndicator = false

        contentView.addSubview(tableView)
        tableView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with categories: [String]) {
        self.categories = categories
    }

}

extension MenuCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        cell.configure(with: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
