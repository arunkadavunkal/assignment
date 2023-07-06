//
//  FaqServiceMock.swift
//  AssignmentTests
//
//  Created by arun.joseph on 06/07/2023.
//

import Foundation
import Service
@testable import Assignment

final class FaqServiceMock: FaqServiceProtocol {
    
    var isFailed = false
    
    func fetch() async throws -> [RemoteFaq] {
        if isFailed {
            throw CustomError.fetchError
        }
        return try JSONDecoder()
            .decode([RemoteFaq].self, from: Data(forResource: "MockFaqs"))
    }
}

// MARK: Custom error
enum CustomError: LocalizedError {
    case fetchError
    
    var errorDescription: String? {
        switch self {
        case .fetchError:
            return "error while fetching"
        }
    }
}
