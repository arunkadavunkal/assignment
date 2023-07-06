//
//  FaqDeatilViewModelTests.swift
//  AssignmentTests
//
//  Created by arun.joseph on 07/07/2023.
//

import Foundation
import XCTest
import Service
@testable import Assignment

final class FaqDeatilViewModelTests: XCTestCase {
    
    var viewModel: FaqDetailViewModelType!
    
    func testGetTitle() throws {
        let faqelements = try JSONDecoder()
            .decode([RemoteFaqElement].self,from: Data(forResource: "MockFaqElements"))
        viewModel = FaqDetailViewModel(faqElements: faqelements)
        
        let tittle = viewModel.getTitle()
        
        XCTAssertEqual(tittle, "How is a dictionary different from an array?")
    }
    
    func testGetBody() throws {
        let faqelements = try JSONDecoder()
            .decode([RemoteFaqElement].self,from: Data(forResource: "MockFaqElements"))
        viewModel = FaqDetailViewModel(faqElements: faqelements)
        
        let body = viewModel.getBody()
        
        XCTAssertEqual(body, "Suggested approach: It’s all down to how you access data: arrays must be accessed using the index of each element, whereas dictionaries can be accessed using something you define – strings are very common. Make sure and give practical examples of where each would be used.")
    }
    
    func testGetAction() throws {
        let faqelements = try JSONDecoder()
            .decode([RemoteFaqElement].self,from: Data(forResource: "MockFaqElements"))
        viewModel = FaqDetailViewModel(faqElements: faqelements)
        
        let buttonElements = viewModel.getAction()
        
        XCTAssertEqual(buttonElements.title, "More information")
        XCTAssertEqual(buttonElements.url, "https://developer.apple.com/documentation/swift/dictionary")
    }
}
