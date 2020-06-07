//
//  CardFeed.swift
//  Google Primer Mock
//
//  Created by Jay Mehta on 07/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import Foundation

struct CardFeed: Codable {
    let cards: [Card]

    enum CodingKeys: String, CodingKey {
        case cards = "data"
    }
}
