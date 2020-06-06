//
//  HomeViewModel.swift
//  Google Primer Mock
//
//  Created by Jay Mehta on 07/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import UIKit

class HomeViewModel {

    // MARK: - Variable declaration

    let preferredStatusBarStyle: UIStatusBarStyle = .lightContent
    private var cards = [Card]()

    // MARK: - Get Data Methods

    func numberOfCards() -> Int {
        return cards.count
    }

    func textForCard(atIndex index: Int) -> String? {
        // We check whether provided index exists or not. If not we return nil.
        if cards.count > index {
            return cards[index].text
        }
        return nil
    }
}
