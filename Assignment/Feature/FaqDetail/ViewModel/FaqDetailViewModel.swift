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
    func getFaqElementsForUI() -> (titles: [String],
                                   bodys: [String],
                                   actions: [(title: String, url: String)])
}

final class FaqDetailViewModel: FaqDetailViewModelType {

    var faqElements: [RemoteFaqElement]

    init(faqElements: [RemoteFaqElement]) {
        self.faqElements = faqElements
    }


    /// get elements from RemoteFaqElemet for creating dynamic UI
    /// - Returns: titles: type of [String] when type is "title",
    /// bodys: type of [String] when type is "body",
    ///actions: array of tuple [(title: String, url: String)]; title is "text" and url is "action"
    func getFaqElementsForUI() -> (titles: [String],
                                   bodys: [String],
                                   actions: [(title: String, url: String)]) {

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
        return (titles: titles, bodys: bodys, actions: actions)
    }
}
