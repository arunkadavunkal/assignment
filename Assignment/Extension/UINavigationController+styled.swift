//
//  UINavigationController+styled.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit

extension UINavigationController {

    @discardableResult
    func styled() -> Self {
        navigationBar.tintColor = .textColor
        return self
    }
}
