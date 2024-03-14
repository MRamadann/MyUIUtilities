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
    
    func setAttributedText(_ attributedText: NSAttributedString?, color: UIColor, font: UIFont, alignment: NSTextAlignment) {
            guard let attributedText = attributedText else { return }
            let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)
            mutableAttributedText.addAttributes([.foregroundColor: color, .font: font], range: NSRange(location: 0, length: attributedText.length))
            self.attributedText = mutableAttributedText
            self.textAlignment = alignment
        }
    
    func setText(_ text: String?, kerning: CGFloat) {
            guard let text = text else { return }
            let attributedString = NSAttributedString(string: text, attributes: [NSAttributedString.Key.kern: kerning])
            self.attributedText = attributedString
        }
    
    func setTextAlignment(_ alignment: NSTextAlignment, numberOfLines: Int = 1) {
           self.textAlignment = alignment
           self.numberOfLines = numberOfLines
       }
}

