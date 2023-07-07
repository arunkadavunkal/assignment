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
}
