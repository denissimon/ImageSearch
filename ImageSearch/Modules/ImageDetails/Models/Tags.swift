//
//  Tags.swift
//  ImageSearch
//
//  Created by Denis Simon on 04/12/2020.
//  Copyright © 2020 Denis Simon. All rights reserved.
//

import Foundation

struct Tags: Codable {
    
    struct HotTags: Codable {
        let tag: [Tag]
    }
    
    let period: String
    let count: Int
    let hottags: HotTags
    let stat: String
}
