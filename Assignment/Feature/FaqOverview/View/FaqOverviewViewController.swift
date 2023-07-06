//
//  FaqOverviewViewController.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import UIKit
import SnapKit
import Service
import Combine

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
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContent()
        fetchFaqs()
    }

    private func fetchFaqs() {
        Task {
            await viewModel.fetchFaqs()
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

        let retryButton = UIButton(text: "Retry")
        contentView.addArrangedSubview(titleLabel)
        contentView.setCustomSpacing(.itemMargin, after: titleLabel)
        contentView.addArrangedSubview(retryButton)

        viewModel.fetchStatusPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] fetchStatus in
                guard let self else { return }
                switch fetchStatus {
                case .processing:
                    break
                case .success:
                    viewModel.faqElements.forEach { faqElement in
                        if self.viewModel.isTitle(faqElement) {
                            let faqOverViewItem = FaqOverviewItemView(faqElement.text)
                            self.contentView.addArrangedSubview(faqOverViewItem)
                            self.contentView.addArrangedSubview(UIView().divider())
                        }
                    }
                    retryButton.isHidden = true
                case .error:
                    retryButton.isHidden = false
                    retryButton.primary {
                        self.fetchFaqs()
                    }
                }
            }.store(in: &cancellables)

    }
}
