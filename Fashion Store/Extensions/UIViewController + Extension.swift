//
//  UIViewController + Extension.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 9.10.24.
//

import Foundation
import UIKit

extension UIViewController {
    var topBarHeight: CGFloat {
        return navigationController?.navigationBar.frame.maxY ?? 0.0

    }
    
       var navigationBarHeight: CGFloat {
           return self.navigationController?.navigationBar.frame.height ?? 0.0
       }
}
