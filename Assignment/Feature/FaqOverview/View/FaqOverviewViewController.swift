//
//  FaqOverviewViewController.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit
import SnapKit
import Service

private extension CGFloat {
    static let viewPadding: CGFloat = 20
    static let itemMargin: CGFloat = 20
}

final class FaqOverviewViewController: UIViewController {

    private let headerBackground = UIView().headerCard()
    private let scrollView = UIScrollView()
    private let contentView = UIStackView().verticalCard(spacing: 0)
    private let titleLabel = UILabel(text: "FAQ Overview").title()
    private var viewModel: FaqOverViewModelType = FaqOverViewViewModel(faqService: FaqService())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContent()
        fetchFaqs()
    }

    private func fetchFaqs() {
        Task {
            viewModel.fetchFaqs
        }
    }

}

private extension FaqOverviewViewController {

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

        let action = UIAction { _ in
            self.navigationController?.pushViewController(FaqDetailViewController(), animated: true)
        }

        contentView.addArrangedSubview(titleLabel)
        contentView.setCustomSpacing(.itemMargin, after: titleLabel)

        // The retry button to show if data loading fails
        contentView.addArrangedSubview(UIButton(text: "Retry").primary {
            // Execute action
        })

        // The Items to show if data loading succeeds
        (0...5).forEach { i in
            if i > 0 {
                contentView.addArrangedSubview(UIView().divider())
            }

            let item = FaqOverviewItemView("Question #\(i)")
            item.addAction(action, for: .touchUpInside)
            contentView.addArrangedSubview(item)
        }
    }
}
