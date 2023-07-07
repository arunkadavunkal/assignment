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
    func getFaqElementsForUI() -> FaqUICompactableElements
}

final class FaqDetailViewModel: FaqDetailViewModelType {

    var faqElements: [RemoteFaqElement]

    init(faqElements: [RemoteFaqElement]) {
        self.faqElements = faqElements
    }

    /// get elements from RemoteFaqElemet for creating dynamic UI
    /// - Returns: FaqUICompactableElements contains;
    ///  titles - array of string where type is title
    ///  bodys - array of String where type is body
    ///  array of tupe containing title as String and url as Srting where type is button
    func getFaqElementsForUI() -> FaqUICompactableElements {

        var titles: [String] = []
        var bodys: [String] = []
        var actions: [(title: String, url: String)] = []

        for faqElement in faqElements {
            if faqElement.isTitle {
                titles.append(faqElement.text)
            }

            if faqElement.isBody {
                bodys.append(faqElement.text)
            }

            if faqElement.isButton {
                actions.append((title: faqElement.text, url: faqElement.action ?? ""))
            }
        }
        return FaqUICompactableElements(titles: titles,
                                        bodys: bodys,
                                        actions: actions)
    }
}
