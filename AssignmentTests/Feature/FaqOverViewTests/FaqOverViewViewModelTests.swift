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

final class FaqOverViewViewModelTestsL: XCTestCase {
    
    var viewModel: FaqOverViewModelType!
    var cancellables = Set<AnyCancellable>()
    
    func testFetchFaqs() async throws {
        viewModel = FaqOverViewViewModel(faqService: FaqServiceMock())
        
        await viewModel.fetchFaqs()
        
        XCTAssertEqual(viewModel.faqs.count, 2)
        viewModel.fetchStatusPublisher.sink { fetchStatus in
            XCTAssertEqual(fetchStatus, .success)
        }.store(in: &cancellables)
    }
    
    func testFetchFailed() async throws {
        let serviceMock = FaqServiceMock()
        serviceMock.isFailed = true
        viewModel = FaqOverViewViewModel(faqService: serviceMock)
        

        await viewModel.fetchFaqs()
        
        XCTAssertEqual(viewModel.faqs.count, 0)
        viewModel.fetchStatusPublisher.sink { fetchStatus in
            XCTAssertEqual(fetchStatus, .error("error while fetching"))
        }.store(in: &cancellables)
    }
    
    func testIsTitleReturnsTrue() async throws {
        viewModel = FaqOverViewViewModel(faqService: FaqServiceMock())

        await viewModel.fetchFaqs()
        
        let faqElements = try JSONDecoder().decode([RemoteFaqElement].self, from: Data(forResource: "MockFaqElement"))
        let isTitle = viewModel.isTitle(faqElements[0])
        
        XCTAssertTrue(isTitle)
    }
    
    func testIsTitleReturnsFalse() async throws {
        viewModel = FaqOverViewViewModel(faqService: FaqServiceMock())

        await viewModel.fetchFaqs()
        
        let faqElements = try JSONDecoder().decode([RemoteFaqElement].self, from: Data(forResource: "MockFaqElement"))
        let isTitle = viewModel.isTitle(faqElements[1])
        
        XCTAssertFalse(isTitle)
    }
}
