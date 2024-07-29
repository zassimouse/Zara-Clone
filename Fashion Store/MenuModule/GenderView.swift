//
//  GenderView.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 28.07.24.
//

import UIKit

class GenderView: UILabel {
    
    var currentItem = 0
    
    var labels: [GenderLabel] = [GenderLabel(with: "WOMAN"), GenderLabel(with: "MAN"), GenderLabel(with: "KIDS")]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.alignment = .center
        stackView.spacing = 30
        stackView.isUserInteractionEnabled = true
        
        labels.forEach { label in
            stackView.addArrangedSubview(label)
            let w = label.intrinsicContentSize.width + 10
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
            tapGesture.numberOfTapsRequired = 2
            tapGesture.numberOfTouchesRequired = 1
            
            tapGesture.numberOfTapsRequired = 2
            tapGesture.numberOfTouchesRequired = 1
            
            label.addGestureRecognizer(tapGesture)
            label.isUserInteractionEnabled = true
            
            
            label.widthAnchor.constraint(equalToConstant: w).isActive = true
        }
        labels[0].onBold()
        
        let bottomView = UIView()
        bottomView.backgroundColor = .label
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(stackView)
        addSubview(bottomView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            bottomView.heightAnchor.constraint(equalToConstant: 1),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 0.5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectItem(at position: Int) {
        labels[currentItem].offBold()
        labels[position].onBold()
        currentItem = position
        print("bye")
    }
    
    @objc private func handleTapGesture(_ sender: UITapGestureRecognizer) {
        // Debug: Ensure method is called
        print("Tap gesture executed on label:\(String(describing: sender.view))")
        
        if let tappedLabel = sender.view as? GenderLabel,
           let index = labels.firstIndex(of: tappedLabel) {
            selectItem(at: index)
        }
    }
}
