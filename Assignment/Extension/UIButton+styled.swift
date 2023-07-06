//
//  UIButton+styled.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit
import SnapKit

private extension CGFloat {
    static let buttonRadius: CGFloat = 10
    static let minimumTappableDimension: CGFloat = 50
}

extension UIButton {

    convenience init(text: String) {
        self.init(frame: .zero)
        setTitle(text, for: .normal)
    }

    @discardableResult
    func primary(onTap: @escaping () -> Void) -> Self {
        backgroundColor = .buttonColor
        layer.cornerRadius = CGFloat.buttonRadius
        titleLabel?.boldBody()
        snp.makeConstraints { $0.height.greaterThanOrEqualTo(CGFloat.minimumTappableDimension) }
        addAction(UIAction { _ in onTap() }, for: .touchUpInside)
        return self
    }
}
