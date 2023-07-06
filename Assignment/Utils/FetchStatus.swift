//
//  FetchStatus.swift
//  Assignment
//
//  Created by arun.joseph on 06/07/2023.
//

import Foundation

enum FetchStatus: Equatable {
    case processing
    case success
    case error(String)

    static func == (lhs: FetchStatus, rhs: FetchStatus) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success): return true
        case (.processing, .processing): return true
        case (.error, .error): return true
        default: return false
        }
    }
}
