//
//  UIView.swift
//  
//
//  Created by Apple on 11/03/2024.
//

import UIKit

extension UIView {
    
    // Function to set view's origin
    func setOrigin(_ origin: CGPoint) {
        frame.origin = origin
    }
    
    // Function to set view's size
    func setSize(_ size: CGSize) {
        frame.size = size
    }
    
    // Function to set view's width
    func setWidth(_ width: CGFloat) {
        frame.size.width = width
    }
    
    // Function to set view's height
    func setHeight(_ height: CGFloat) {
        frame.size.height = height
    }
    
    // Function to set view's x position
    func setX(_ x: CGFloat) {
        frame.origin.x = x
    }
    
    // Function to set view's y position
    func setY(_ y: CGFloat) {
        frame.origin.y = y
    }
    
    
    // Function to round corners of the view
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    // Function to add a border with specified color and width
    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    // Function to add subviews
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    // Function to perform a shake animation
    func shake(duration: TimeInterval = 0.5, translation: CGFloat = 10) {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = duration
        shakeAnimation.autoreverses = true
        shakeAnimation.repeatCount = 1
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - translation, y: center.y))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: center.x + translation, y: center.y))
        layer.add(shakeAnimation, forKey: "shake")
    }
    
}
