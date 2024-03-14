//
//  UIScrollView.swift
//  
//
//  Created by Apple on 11/03/2024.
//

import UIKit

extension UIScrollView {
    // Add a function to scroll to the top
    func scrollToTop(animated: Bool) {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: animated)
    }

    // Add a function to scroll to the bottom
    func scrollToBottom(animated: Bool) {
        let contentHeight = self.contentSize.height
        let boundsHeight = self.bounds.size.height
        let desiredOffset = CGPoint(x: 0, y: max(-contentInset.top, contentHeight - boundsHeight + contentInset.bottom))
        setContentOffset(desiredOffset, animated: animated)
    }

    // Add a function to scroll to a specific view
    func scrollToView(view: UIView, animated: Bool) {
        let rect = convert(view.bounds, from: view)
        scrollRectToVisible(rect, animated: animated)
    }

    // Add a function to enable/disable scrolling
    func setScrollEnabled(_ enabled: Bool) {
        isScrollEnabled = enabled
    }

    // Add a function to set content offset with optional animation
    func setContentOffset(_ offset: CGPoint, animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.contentOffset = offset
            }
        } else {
            self.contentOffset = offset
        }
    }
}

