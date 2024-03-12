//
//  UILabel.swift
//  
//
//  Created by Apple on 11/03/2024.
//

import UIKit

extension UILabel {
    func applyTitleStyle() {
        font = UIFont.boldSystemFont(ofSize: 18)
        textColor = .black
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
}

