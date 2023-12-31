//
//  FaqOverViewViewModel.swift
//  Assignment
//
//  Created by arun.joseph on 06/07/2023.
//

import Foundation
import Service
import Combine

protocol FaqOverViewModelType {
    func fetchFaqs() async
    var fetchStatusPublisher: Published<FetchStatus>.Publisher { get }
    var faqs: [RemoteFaq] { get }
    func filterTitleElements(from faqElements: [RemoteFaqElement]) -> [RemoteFaqElement]
    func isShowDivider(index: Int) -> Bool
}

final class FaqOverViewViewModel: FaqOverViewModelType {

    let faqService: FaqServiceProtocol
    private(set) var faqs: [RemoteFaq] = []
    @Published private(set) var fetchStatus: FetchStatus = .processing
    var fetchStatusPublisher: Published<FetchStatus>.Publisher { $fetchStatus }

    init(faqService: FaqServiceProtocol = FaqService()) {
        self.faqService = faqService
    }

    /// fetching Faqs from FaqService
    func fetchFaqs() async {
        self.fetchStatus = .processing
        do {
            self.faqs = try await faqService.fetch()
            self.fetchStatus = .success
        } catch {
            self.fetchStatus = .error(error.localizedDescription)
        }
    }

    /// Filtering [RemoteFaqElement] based on type title
    /// - Parameter faqElements: [RemoteFaqElement] passed from view
    /// - Returns: [RemoteFaqElement] filtered based on type "title"
    func filterTitleElements(from faqElements: [RemoteFaqElement]) -> [RemoteFaqElement] {
        return faqElements.filter({ $0.isTitle })
    }

    /// For showing divider
    /// - Parameter index: index passed from view
    /// - Returns: bool to determine divider showing
    func isShowDivider(index: Int) -> Bool {
        return index < (faqs.count - 1)
    }
}
