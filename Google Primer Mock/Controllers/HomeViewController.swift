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

    // MARK: - System Preference Methods

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        cardsKolodaView.dataSource = self
    }

    // MARK: - User interaction methods

    @IBAction private func restartButtonPressed(_ sender: UIButton) {
    }

    @IBAction private func leftArrowButtonPressed(_ sender: UIButton) {
    }

    @IBAction private func rightArrowPressed(_ sender: UIButton) {
    }

}

extension HomeViewController: KolodaViewDataSource {
    // MARK: - KolodaViewDataSource Methods

    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 0
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIView()
    }

}
