//
//  FaqOverViewViewModel.swift
//  Assignment
//
//  Created by arun.joseph on 06/07/2023.
//

import Foundation
import Service

protocol FaqOverViewModelType {
    var faqElements: [RemoteFaq] { get }
    var error: String? { get }
    func fetchFaqs() async
}

final class FaqOverViewViewModel: FaqOverViewModelType {

    let faqService: FaqServiceProtocol
    @Published var faqElements: [RemoteFaq] = []
    @Published var error: String?

    init(faqService: FaqServiceProtocol = FaqService()) {
        self.faqService = faqService
    }

    func fetchFaqs() async {
        do {
            self.faqElements = try await faqService.fetch()
        } catch {
            self.error = error.localizedDescription
        }
    }
}
