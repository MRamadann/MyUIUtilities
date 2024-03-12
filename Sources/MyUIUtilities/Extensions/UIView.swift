//
//  UIView.swift
//  
//
//  Created by Apple on 11/03/2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
