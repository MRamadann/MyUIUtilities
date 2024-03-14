//
//  UITableView.swift
//  
//
//  Created by Apple on 11/03/2024.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: String(describing: cellType))
    }
    
    // Add a function to deselect all rows
    func deselectAllRows(animated: Bool) {
        guard let selectedIndexPaths = indexPathsForSelectedRows else { return }
        for indexPath in selectedIndexPaths {
            deselectRow(at: indexPath, animated: animated)
        }
    }

    // Add a function to dequeue a reusable cell with a class
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Unable to dequeue cell with identifier: \(String(describing: T.self))")
        }
        return cell
    }
    
    // Add a function to register a header/footer view with a class
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(viewClass: T.Type) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: String(describing: viewClass))
    }

}

