//
//  UIViewExtensions.swift
//  HyRead
//
//  Created by Ray Chang on 2024/3/10.
//

import Foundation
import UIKit

extension UIView {
    func round(_ radious: CGFloat = 8) {
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }
}
