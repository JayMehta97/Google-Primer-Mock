//
//  CardView.swift
//  Google Primer Mock
//
//  Created by Jay Mehta on 07/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import UIKit

class CardView: UIView {

    // MARK: - Variable declaration

    private let textLabelMargin: CGFloat = 20

    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 22)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }()

    // MARK: - Initialization Methods

    init(withFrame frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Life Cycle Methods

    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = CGRect(x: textLabelMargin, y: textLabelMargin, width: frame.width - (textLabelMargin * 2), height: frame.height - (textLabelMargin * 2))
    }
}

extension CardView {
    // MARK: - UI Setup Methods

    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

    private func addChildViews() {
        addSubview(textLabel)
    }

    private func setup() {
        setupView()
        addChildViews()
    }
}

extension CardView {
    // MARK: - Set Data Methods

    func setCardData(fromCard card: Card) {
        self.textLabel.text = card.text
    }
}
