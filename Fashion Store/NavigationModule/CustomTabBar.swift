//
//  CustomTabBar.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 29.09.24.
//

import UIKit

class CustomTabBar: UITabBar, UITabBarControllerDelegate {
    
    private let indicatorShapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabTar()
        setupIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        moveIndicator(to: 0)
    }
    
    private func setupTabTar() {
        tintColor = .label
        unselectedItemTintColor = .label
        backgroundColor = .systemBackground
    }
    
}

// MARK: Draw Line
extension CustomTabBar {

    private func setupIndicator() {
        let path = createIndicatorPath(at: 0)
        indicatorShapeLayer.path = path.cgPath
        indicatorShapeLayer.strokeColor = UIColor.label.cgColor
        indicatorShapeLayer.lineWidth = 1
        layer.addSublayer(indicatorShapeLayer)
    }

    func moveIndicator(to index: Int) {
        let path = createIndicatorPath(at: index)
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = indicatorShapeLayer.path
        animation.toValue = path.cgPath
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        indicatorShapeLayer.add(animation, forKey: "moveIndicatorAnimation")
        indicatorShapeLayer.path = path.cgPath
    }

    private func createIndicatorPath(at index: Int) -> UIBezierPath {
        let tabWidth = bounds.width / CGFloat(items?.count ?? 1)
        let indicatorWidth: CGFloat = 6
        let startX = CGFloat(index) * tabWidth + (tabWidth - indicatorWidth) / 2
        let path = UIBezierPath()
        path.move(to: CGPoint(x: startX, y: bounds.height - 50))
        path.addLine(to: CGPoint(x: startX + indicatorWidth, y: bounds.height - 50))
        return path
    }
}
