//
//  RemoteFaqElement+Extension.swift
//  Assignment
//
//  Created by arun.joseph on 07/07/2023.
//

import Foundation
import Service

extension RemoteFaqElement {
    var isTitle: Bool {
        return self.type == "title"
    }

    var isBody: Bool {
        return self.type == "body"
    }

    var isButton: Bool {
        return self.type == "button"
    }
}
