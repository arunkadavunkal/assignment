//
//  FaqDetailViewController.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit

private extension CGFloat {
    static let viewPadding: CGFloat = 20
}

final class FaqDetailViewController: UIViewController {

    private let headerBackground = UIView().headerCard()
    private let scrollView = UIScrollView()
    private let contentView = UIStackView().verticalCard()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContent()
    }
}

private extension FaqDetailViewController {

    func setupView() {
        view.backgroundColor = .backgroundColor
        view.addSubview(headerBackground)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.bottom.right.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(CGFloat.viewPadding)
            $0.top.equalToSuperview().inset(CGFloat.viewPadding)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview().offset(-2 * CGFloat.viewPadding)
        }

        headerBackground.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }

    func setupContent() {

        // example Title Element
        contentView.addArrangedSubview(UILabel(text: "Title").title())

        // example Body Element
        contentView.addArrangedSubview(UILabel(text: "Body").body())

        // example Button Element
        contentView.addArrangedSubview(UIButton(text: "Button").primary {
            // Execute Action
        })
    }
}
