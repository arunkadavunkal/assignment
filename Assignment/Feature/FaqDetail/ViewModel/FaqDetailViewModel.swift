//
//  FaqDetailViewModel.swift
//  Assignment
//
//  Created by arun.joseph on 06/07/2023.
//

import Foundation
import Service

protocol FaqDetailViewModelType {
    var faqElements: [RemoteFaqElement] { get }
    func getTitle() -> String
    func getBody() -> String
    func getAction() -> (title: String, url: String)
}

final class FaqDetailViewModel: FaqDetailViewModelType {

    var faqElements: [RemoteFaqElement]

    init(faqElements: [RemoteFaqElement]) {
        self.faqElements = faqElements
    }

    
    /// Get title text based on type
    /// - Returns: title text as String
    func getTitle() -> String {
        return faqElements.first(where: { $0.type == "title" })?.text ?? ""
    }

    
    /// Get body based on type
    /// - Returns: body text as string
    func getBody() -> String {
        return faqElements.first(where: { $0.type == "body" })?.text ?? ""
    }

    
    /// Get urlString and title based on type
    /// - Returns: tuple of title and url, both are String
    func getAction() -> (title: String, url: String) {
        let faqElement = faqElements.first(where: { $0.type == "button" })
        return (title: faqElement?.text ?? "", url: faqElement?.action ?? "")
    }
}
