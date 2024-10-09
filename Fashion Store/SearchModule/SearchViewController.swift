//
//  SearchViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 30.07.24.
//

import UIKit

class SearchViewController: UITabBarController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "What are you looking for?"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var searchField: UITextField = {
        let searchField = UITextField()
        searchField.backgroundColor = .systemBackground
        searchField.font = .systemFont(ofSize: 22, weight: .semibold)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        return searchField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        view.addSubview(searchField)
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchField.becomeFirstResponder()
    }
}
