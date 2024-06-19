//
//  File.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 14.03.24.
//

import Foundation
import UIKit

extension UIFont {
    
    static public var thinFont: UIFont {
        return UIFont.systemFont(ofSize: 11, weight: .light)
    }
    
    static public var lightFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    static public var boldFont: UIFont {
        return UIFont.systemFont(ofSize: 11, weight: .bold)
    }
    
    static public var infoFont: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    static public var infoTagFont: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    
    static public var largeLabelFont: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    static public var smallLabelFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    static public var buttonFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    static public var largeButtonFont: UIFont {
        return UIFont.systemFont(ofSize: 30, weight: .light)
    }
    
    static public var deleteButtonFont: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: .light)
    }
}


extension UIButton {
    
    func addTopBorder(with color: UIColor, andWidth borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: borderWidth)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorder(with color: UIColor, andWidth borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: borderWidth)
        self.layer.addSublayer(border)
    }
    
    func addTopAndBottomBorders(with color: UIColor, andWidth borderWidth: CGFloat) {
        self.addTopBorder(with: color, andWidth: borderWidth)
        self.addBottomBorder(with: color, andWidth: borderWidth)
    }
}


