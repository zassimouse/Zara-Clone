//
//  UIStackView + Extension.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 28.07.24.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubview(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
