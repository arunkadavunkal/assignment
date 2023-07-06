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
    var viewModel: FaqDetailViewModelType?

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
        guard let viewModel else { return }
        contentView.addArrangedSubview(UILabel(text: viewModel.getTitle()).title())
        contentView.addArrangedSubview(UILabel(text: viewModel.getBody()).body())
        let buttonElements = viewModel.getAction()
        contentView.addArrangedSubview(UIButton(text: buttonElements.title).primary {
            guard let url = URL(string: buttonElements.url) else { return }
            UIApplication.shared.open(url)
        })
    }
}
