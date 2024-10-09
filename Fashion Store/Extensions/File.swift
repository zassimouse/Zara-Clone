//
//  File.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 14.03.24.
//

import Foundation
import UIKit

extension UIFont {
    
    static public var menuFont: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    static public var thinFont: UIFont {
        return UIFont.systemFont(ofSize: 11, weight: .light)
    }
    
    static public var lightFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    static public var boldFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    
    static public var infoFont: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .light)
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


//extension UIView {
//    
//    func addTopBorder(with color: UIColor, andWidth borderWidth: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: borderWidth)
//        self.layer.addSublayer(border)
//    }
//    
//    func addBottomBorder(with color: UIColor, andWidth borderWidth: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: borderWidth)
//        self.layer.addSublayer(border)
//    }
//    
//    func addTopAndBottomBorders(with color: UIColor, andWidth borderWidth: CGFloat) {
//        self.addTopBorder(with: color, andWidth: borderWidth)
//        self.addBottomBorder(with: color, andWidth: borderWidth)
//    }
//}
//
//
//enum Border: Int {
//    case top = 0
//    case bottom
//    case right
//    case left
//}
//
//extension UIView {
//    func addBorder(for side: Border, withColor color: UIColor, borderWidth: CGFloat) -> CALayer {
//       let borderLayer = CALayer()
//       borderLayer.backgroundColor = color.cgColor
//
//       let xOrigin: CGFloat = (side == .right ? frame.width - borderWidth : 0)
//       let yOrigin: CGFloat = (side == .bottom ? frame.height - borderWidth : 0)
//
//       let width: CGFloat = (side == .right || side == .left) ? borderWidth : frame.width
//       let height: CGFloat = (side == .top || side == .bottom) ? borderWidth : frame.height
//
//       borderLayer.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
//       layer.addSublayer(borderLayer)
//       return borderLayer
//    }
//}
//
//extension CALayer {
//    func updateBorderLayer(for side: Border, withViewFrame viewFrame: CGRect) {
//        let xOrigin: CGFloat = (side == .right ? viewFrame.width - frame.width : 0)
//        let yOrigin: CGFloat = (side == .bottom ? viewFrame.height - frame.height : 0)
//
//        let width: CGFloat = (side == .right || side == .left) ? frame.width : viewFrame.width
//        let height: CGFloat = (side == .top || side == .bottom) ? frame.height : viewFrame.height
//
//        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
//    }
//}
