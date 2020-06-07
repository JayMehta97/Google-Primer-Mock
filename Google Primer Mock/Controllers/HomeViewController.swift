//
//  HomeViewController.swift
//  Google Primer Mock
//
//  Created by Jay Mehta on 06/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Outlets

    @IBOutlet private weak var restartButton: UIButton!
    @IBOutlet private weak var cardsKolodaView: KolodaView!
    @IBOutlet private weak var pageControlView: UIView!
    @IBOutlet private weak var leftArrowButton: UIButton!
    @IBOutlet private weak var rightArrowButton: UIButton!

    // MARK: - Variable declaration

    let homeVM = HomeViewModel()

    // MARK: - System Preference Methods

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return homeVM.preferredStatusBarStyle
    }

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        cardsKolodaView.dataSource = self
    }

    // MARK: - User interaction methods

    @IBAction private func restartButtonPressed(_ sender: UIButton) {
        cardsKolodaView.resetCurrentCardIndex()
    }

    @IBAction private func leftArrowButtonPressed(_ sender: UIButton) {
        cardsKolodaView.revertAction()
    }

    @IBAction private func rightArrowPressed(_ sender: UIButton) {
        cardsKolodaView.swipe(.up, force: false)
    }

}

extension HomeViewController: KolodaViewDataSource {
    // MARK: - KolodaViewDataSource Methods

    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return homeVM.numberOfCards()
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        guard let card = homeVM.card(forIndex: index) else {
            return UIView()
        }
        let cardView = CardView(withFrame: cardsKolodaView.frame)
        cardView.setCardData(fromCard: card)
        return cardView
    }

}
