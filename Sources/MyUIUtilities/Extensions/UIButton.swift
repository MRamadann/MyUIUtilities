//
//  UIButton.swift
//  
//
//  Created by Apple on 11/03/2024.
//

import UIKit

extension UIButton {
    func styleButton() {
        layer.cornerRadius = 8
        backgroundColor = .blue
        setTitleColor(.white, for: .normal)
    }
    
    func setBorder(color: UIColor, width: CGFloat) {
            layer.borderColor = color.cgColor
            layer.borderWidth = width
        }
    
    func roundCorners(radius: CGFloat) {
           layer.cornerRadius = radius
           layer.masksToBounds = true
       }
}

