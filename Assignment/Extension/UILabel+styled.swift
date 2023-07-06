//
//  UILabel+styled.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit

private extension CGFloat {
    static let titleFontSize: CGFloat = 20
    static let bodyFontSize: CGFloat = 16
}

extension UILabel {

    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }

    @discardableResult
    func title() -> Self {
        font = UIFont.boldSystemFont(ofSize: .titleFontSize)
        textColor = .textColor
        numberOfLines = 0
        return self
    }

    @discardableResult
    func boldBody() -> Self {
        font = UIFont.boldSystemFont(ofSize: .bodyFontSize)
        textColor = .textColor
        numberOfLines = 0
        return self
    }

    @discardableResult
    func body() -> Self {
        font = UIFont.systemFont(ofSize: .bodyFontSize)
        textColor = .textColor
        numberOfLines = 0
        return self
    }
}
