//
//  FaqOverViewViewModelTests.swift
//  AssignmentTests
//
//  Created by arun.joseph on 06/07/2023.
//

import Foundation
import XCTest
import Combine
import Service
@testable import Assignment

final class FaqOverViewViewModelTests: XCTestCase {

    func testFetchFaqs() async throws {
        let viewModel = FaqOverViewViewModel(faqService: FaqServiceMock())
        
        await viewModel.fetchFaqs()
        
        XCTAssertEqual(viewModel.faqs.count, 2)
        viewModel.fetchStatusPublisher.sink { fetchStatus in
            XCTAssertEqual(fetchStatus, .success)
        }.cancel()
    }
    
    func testFetchFailed() async throws {
        let serviceMock = FaqServiceMock()
        serviceMock.isFailed = true
        let viewModel = FaqOverViewViewModel(faqService: serviceMock)
        

        await viewModel.fetchFaqs()
        
        XCTAssertEqual(viewModel.faqs.count, 0)
        viewModel.fetchStatusPublisher.sink { fetchStatus in
            XCTAssertEqual(fetchStatus, .error("error while fetching"))
        }.cancel()
    }
    
    func testFilterTitleElementsFromAllFaqElements() async throws {
        let serviceMock = FaqServiceMock()
        let viewModel = FaqOverViewViewModel(faqService: serviceMock)

        await viewModel.fetchFaqs()

        let faqElements = viewModel.faqs[0].elements
        XCTAssertEqual(viewModel.filterTitleElements(from: faqElements).count, 1)
    }

    func testIsShowDividerTrue() async throws {
        let serviceMock = FaqServiceMock()
        let viewModel = FaqOverViewViewModel(faqService: serviceMock)

        await viewModel.fetchFaqs()

        XCTAssertTrue(viewModel.isShowDivider(index: 0))
    }

    func testIsShowDividerFalse() async throws {
        let serviceMock = FaqServiceMock()
        let viewModel = FaqOverViewViewModel(faqService: serviceMock)

        await viewModel.fetchFaqs()

        XCTAssertFalse(viewModel.isShowDivider(index: 1))
    }
}
