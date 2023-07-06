//
//  UIImageView+styled.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit

extension UIImageView {

    @discardableResult
    func icon(systemName: String) -> Self {
        image = UIImage(systemName: systemName)
        contentMode = .scaleAspectFit
        tintColor = .textColor
        setContentCompressionResistancePriority(.required, for: .horizontal)
        return self
    }
}
