//
//  UIView+styled.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit
import SnapKit

private extension CGFloat {
    static let contentViewRadius: CGFloat = 20
    static let dividerHeight: CGFloat = 2
    static let headerHeight: CGFloat = 180
}

extension UIView {

    @discardableResult
    func headerCard() -> Self {
        backgroundColor = .headerColor
        layer.cornerRadius = .contentViewRadius
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        snp.makeConstraints { $0.height.equalTo(CGFloat.headerHeight) }
        return self
    }

    @discardableResult
    func divider() -> Self {
        backgroundColor = .dividerColor
        layer.cornerRadius = CGFloat.dividerHeight / 2
        snp.makeConstraints { $0.height.equalTo(CGFloat.dividerHeight) }
        return self
    }
}
