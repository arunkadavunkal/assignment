//
//  FaqQuestionView.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit
import SnapKit

private extension CGFloat {
    static let cellPadding: CGFloat = 15
    static let itemMargin: CGFloat = 20
}

final class FaqOverviewItemView: UIControl {

    private let titleLabel = UILabel().body()
    private let icon = UIImageView().icon(systemName: "chevron.right")

    init(_ title: String) {
        super.init(frame: .zero)
        setupView()
        setupContent(title: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FaqOverviewItemView {

    func setupView() {
        addSubview(titleLabel)
        addSubview(icon)

        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.verticalEdges.equalToSuperview().inset(CGFloat.cellPadding)
        }

        icon.snp.makeConstraints {
            $0.left.greaterThanOrEqualTo(titleLabel.snp.right).offset(CGFloat.itemMargin)
            $0.right.centerY.equalToSuperview()
        }
    }

    func setupContent(title: String) {
        titleLabel.text = title
    }
}
