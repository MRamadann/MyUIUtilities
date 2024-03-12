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
}

