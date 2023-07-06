//
//  Data+Extension.swift
//  AssignmentTests
//
//  Created by arun.joseph on 06/07/2023.
//

import Foundation

extension Data {
    init(forResource resource: String) throws {
        let url = Bundle(for: BundleToken.self)
            .url(forResource: resource, withExtension: "json")!
        try self.init(contentsOf: url)
    }
}

private final class BundleToken {}
