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

    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Initialization Methods

    init(withFrame frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        addSubview(textLabel)
        addConstraintsToTextLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension CardView {
    // MARK: - Add Constraints Methods

    private func addConstraintsToTextLabel() {
        let top = NSLayoutConstraint(
            item: textLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 0
        )
        let bottom = NSLayoutConstraint(
            item: textLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0
        )
        let leading = NSLayoutConstraint(
            item: textLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 10
        )
        let trailing = NSLayoutConstraint(
            item: textLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 10
        )
        addConstraints([top, bottom, leading, trailing])
    }
}
