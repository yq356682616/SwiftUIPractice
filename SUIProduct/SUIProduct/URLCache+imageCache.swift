//
//  URLCache+imageCache.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/30.
//

import Foundation
extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512_000_000, diskCapacity: 10_000_000_000)
}
