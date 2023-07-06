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
    var faqElements: [RemoteFaqElement] { get }
    func isTitle(_ faqElement: RemoteFaqElement) -> Bool
}

final class FaqOverViewViewModel: FaqOverViewModelType {

    let faqService: FaqServiceProtocol
    var faqs: [RemoteFaq] = []
    var faqElements: [RemoteFaqElement] = []
    @Published var fetchStatus: FetchStatus = .processing
    var fetchStatusPublisher: Published<FetchStatus>.Publisher { $fetchStatus }

    init(faqService: FaqServiceProtocol = FaqService()) {
        self.faqService = faqService
    }

    @MainActor
    func fetchFaqs() async {
        self.fetchStatus = .processing
        do {
            self.faqs = try await faqService.fetch()
            self.getFaqElements()
            self.fetchStatus = .success
        } catch {
            self.fetchStatus = .error(error.localizedDescription)
        }
    }

    // MARK: is type of title
    func isTitle(_ faqElement: RemoteFaqElement) -> Bool {
        return faqElement.type == "title"
    }

    // MARK: get faq elements
    func getFaqElements() {
        for faq in faqs {
            for element in faq.elements {
                faqElements.append(element)
            }
        }
    }
}
