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
}

