// DealCell.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Ячейка сделки
final class DealCell: UITableViewCell, DealCellProtocol {
    // MARK: - Private Enum

    private enum Constants {
        static let reuseIdentifierText = "DealCell"
    }

    // MARK: - Private IBOutlets

    @IBOutlet private var instrumentNameLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var amountLabel: UILabel!
    @IBOutlet private var sideLabel: UILabel!

    // MARK: - Public Properties

    static let reuseIidentifier = Constants.reuseIdentifierText

    // MARK: - Public Methods

    func configure(instrumentName: String, priceValue: Double, amountValue: Double, side: Side) {
        instrumentNameLabel.text = instrumentName.substring(toIndex: 7)
        priceLabel.text = "\(round(priceValue * 100) / 100)"
        amountLabel.text = "\(Int(amountValue))"
        changeSideLabel(side: side)
    }

    // MARK: - Private Methods

    private func changeSideLabel(side: Side) {
        switch side {
        case .sell:
            sideLabel.textColor = .systemRed
        case .buy:
            sideLabel.textColor = .systemGreen
        }
        sideLabel.text = "\(side)"
    }
}
