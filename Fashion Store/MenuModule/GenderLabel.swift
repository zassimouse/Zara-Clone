//
//  GenderLabel.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 28.07.24.
//

import UIKit

class GenderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .label
        text = "MAN"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        addGestureRecognizer(tapGesture)
        font = .systemFont(ofSize: 17)
    }
    
    func onBold() {
        font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    func offBold() {
        font = .systemFont(ofSize: 17)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTapGesture(_ sender: UITapGestureRecognizer) {
        print("Tap gesture executed on label:\(String(describing: sender.view))")
        
//        if let tappedLabel = sender.view as? GenderLabel,
//           let index = labels.firstIndex(of: tappedLabel) {
//            selectItem(at: index)
//        }
    }
}
