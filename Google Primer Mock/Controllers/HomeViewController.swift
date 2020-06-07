//
//  HomeViewController.swift
//  Google Primer Mock
//
//  Created by Jay Mehta on 06/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import FlexiblePageControl
import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Outlets

    @IBOutlet private weak var restartButton: UIButton!
    @IBOutlet private weak var cardsKolodaView: KolodaView!
    @IBOutlet private weak var pageControlView: FlexiblePageControl!
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
        cardsKolodaView.delegate = self

        setup()

        // Get data for card
        getCardDetails()
    }

    // MARK: - User interaction methods

    @IBAction private func restartButtonPressed(_ sender: UIButton) {
        // Reloads the cardsKolodaView
        cardsKolodaView.resetCurrentCardIndex()
        resetPageControl()
        setNavigationButtonStatus()
    }

    @IBAction private func leftArrowButtonPressed(_ sender: UIButton) {
        // Brings the last swiped card from top
        cardsKolodaView.revertAction(direction: .up)
    }

    @IBAction private func rightArrowPressed(_ sender: UIButton) {
        // Swipes the front card to top
        cardsKolodaView.swipe(.up, force: false)
    }

}

extension HomeViewController {
    // MARK: - UI Setup methods

    private func setupPageControl() {
        pageControlView.pageIndicatorTintColor = .lightGray
        pageControlView.currentPageIndicatorTintColor = .white

        let config = FlexiblePageControl.Config(
            displayCount: 7,
            dotSize: 10,
            dotSpace: 4,
            smallDotSizeRatio: 0.5,
            mediumDotSizeRatio: 0.7
        )

        pageControlView.setConfig(config)
    }

    private func setNavigationButtonStatus() {
        leftArrowButton.isHidden = pageControlView.currentPage < 1
        rightArrowButton.isHidden = (pageControlView.currentPage == (homeVM.numberOfCards() - 1)) || homeVM.numberOfCards() == 0
    }

    private func setup() {
        setupPageControl()
        setNavigationButtonStatus()
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

extension HomeViewController: KolodaViewDelegate {
    // MARK: - KolodaViewDelegate Methods

    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.up, .left, .right, .topLeft, .topRight, .down]
    }

    func koloda(_ koloda: KolodaView, revertDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.down, .bottomLeft, .bottomRight]
    }

    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        pageControlView.setCurrentPage(at: index + 1, animated: true)
        setNavigationButtonStatus()
    }

    func koloda(_ koloda: KolodaView, didRevertCardAt index: Int, in direction: SwipeResultDirection?) {
        pageControlView.setCurrentPage(at: index - 1, animated: true)
        setNavigationButtonStatus()
    }
}

extension HomeViewController {
    // MARK: - Card data Methods

    private func getCardDetails() {
        homeVM.getCardDetails {
            DispatchQueue.main.async {
                self.cardsKolodaView.reloadData()
                self.resetPageControl()
                self.setNavigationButtonStatus()
            }
        }
    }
}

extension HomeViewController {
    // MARK: - Page Control Methods

    private func resetPageControl() {
        pageControlView.numberOfPages = homeVM.numberOfCards()

        let currentPage = pageControlView.currentPage - 1
        for page in stride(from: currentPage, to: -1, by: -1) {
            pageControlView.setCurrentPage(at: page)
        }
    }
}
