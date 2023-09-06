//
//  DataExtension.swift
//  LoveMyPet
//
//  Created by userext on 01/09/23.
//

import Foundation
extension Data {
    init?(contentsOfOptionalURL url: URL?) {
        guard let url else { return nil }
        try? self.init(contentsOf: url)
    }
}
