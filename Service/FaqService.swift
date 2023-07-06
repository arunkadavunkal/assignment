//
//  FaqService.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import Foundation

public protocol FaqServiceProtocol {
    func fetch() async throws -> [RemoteFaq]
}

public struct FaqService: FaqServiceProtocol {

    enum Exception: Error {
        case requestFailed
    }

    public init() { }
    
    public func fetch() async throws -> [RemoteFaq] {

        guard Bool.random() else {
            throw Exception.requestFailed
        }

        return try JSONDecoder()
            .decode([RemoteFaq].self, from: Data(forResource: "SampleData"))
    }
}
