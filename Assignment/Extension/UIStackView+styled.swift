//
//  UIStackView+styled.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit

private extension CGFloat {
    static let contentViewRadius: CGFloat = 20
    static let contentViewPadding: CGFloat = 20
    static let contentViewMargin: CGFloat = 20
}

extension UIStackView {

    @discardableResult
    func verticalCard(spacing: CGFloat = .contentViewMargin) -> Self {
        self.layer.cornerRadius = .contentViewRadius
        self.backgroundColor = .white
        self.spacing = spacing
        self.distribution = .fill
        self.axis = .vertical
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: .contentViewPadding,
            leading: .contentViewPadding,
            bottom: .contentViewPadding,
            trailing: .contentViewPadding
        )
        self.isLayoutMarginsRelativeArrangement = true
        self.insetsLayoutMarginsFromSafeArea = false
        return self
    }
}
