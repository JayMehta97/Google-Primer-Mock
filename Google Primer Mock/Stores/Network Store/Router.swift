//
//  Router.swift
//  Google Primer Mock
//
//  Created by Jay Mehta on 07/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import Foundation

enum Router {

    // MARK: - API Request Names

    case getCardDetails
}

extension Router {

    // MARK: - API Request Attributes

    var scheme: String {
        switch self {
        case .getCardDetails:
            return "https"
        }
    }

    var host: String {
        switch self {
        case .getCardDetails:
            return "gist.githubusercontent.com"
        }
    }

    var path: String {
        switch self {
        case .getCardDetails:
            return "/anishbajpai014/d482191cb4fff429333c5ec64b38c197/raw/b11f56c3177a9ddc6649288c80a004e7df41e3b9/HiringTask.json"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getCardDetails:
            return []
        }
    }

    var method: String {
        switch self {
        case .getCardDetails:
            return "GET"
        }
    }
}
