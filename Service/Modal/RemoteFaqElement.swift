//
//  RemoteFaqElement.swift
//  Assignment
//
//  Created by Stefan Renne on 05/07/2023.
//

import Foundation

public struct RemoteFaqElement: Decodable {
    public let type: String
    public let text: String
    public let action: String?
}
