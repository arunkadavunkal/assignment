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
    
    func testGetElementsForUI() throws {
        let faqElements = try JSONDecoder()
            .decode([RemoteFaqElement].self,from: Data(forResource: "MockFaqElements"))
        viewModel = FaqDetailViewModel(faqElements: faqElements)
        
        let remoteFaqElements = viewModel.getFaqElementsForUI()
        
        XCTAssertEqual(remoteFaqElements.titles.count, 1)
        XCTAssertEqual(remoteFaqElements.bodys.count, 2)
        XCTAssertEqual(remoteFaqElements.actions.count, 1)
        XCTAssertEqual(remoteFaqElements.titles[0], "How is a dictionary different from an array?")
        XCTAssertEqual(remoteFaqElements.bodys[0], "Suggested approach: It’s all down to how you access data: arrays must be accessed using the index of each element, whereas dictionaries can be accessed using something you define – strings are very common. Make sure and give practical examples of where each would be used.")
        XCTAssertEqual(remoteFaqElements.bodys[1], "For bonus points you could mention that classes have deinit() methods and structs do not.")
        XCTAssertEqual(remoteFaqElements.actions[0].title, "More information")
        XCTAssertEqual(remoteFaqElements.actions[0].url, "https://developer.apple.com/documentation/swift/dictionary")
    }
}
