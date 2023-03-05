// HeaderCell.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Ячейка хедера сделок
final class HeaderCell: UITableViewHeaderFooterView {
    // MARK: - Private Enum

    private enum Constants {
        static let chevronUpImage = "chevron.up"
        static let chevronDownImage = "chevron.down"
        static let chevronUpDownImage = "chevron.up.chevron.down"
        static let reuserIdentifierText = "HeaderCell"
    }

    // MARK: - Private IBOutlets

    @IBOutlet private var priceButton: UIButton!
    @IBOutlet private var instrumentsButton: UIButton!
    @IBOutlet private var amountButton: UIButton!
    @IBOutlet private var sideButton: UIButton!

    // MARK: - Public Properties

    static let reuseIidentifier = Constants.reuserIdentifierText

    var instrumentHandler: ButtonHandler?
    var priceHandler: ButtonHandler?
    var amountHandler: ButtonHandler?
    var sideHandler: ButtonHandler?
    var buttonState = ButtonState.standart

    // MARK: - Private Methods

    @IBAction private func instrumentButtonAction(_ sender: Any) {
        setupButtonState(stateButton: buttonState, button: instrumentsButton)
        instrumentHandler?(buttonState)
    }

    @IBAction private func priceButtonAction(_ sender: Any) {
        setupButtonState(stateButton: buttonState, button: priceButton)
        priceHandler?(buttonState)
    }

    @IBAction private func amountButtonAction(_ sender: Any) {
        setupButtonState(stateButton: buttonState, button: amountButton)
        amountHandler?(buttonState)
    }

    @IBAction private func sideButtonAction(_ sender: Any) {
        setupButtonState(stateButton: buttonState, button: sideButton)
        sideHandler?(buttonState)
    }

    private func setDefaultImages() {
        instrumentsButton.setImage(UIImage(systemName: Constants.chevronUpDownImage), for: .normal)
        priceButton.setImage(UIImage(systemName: Constants.chevronUpDownImage), for: .normal)
        amountButton.setImage(UIImage(systemName: Constants.chevronUpDownImage), for: .normal)
        sideButton.setImage(UIImage(systemName: Constants.chevronUpDownImage), for: .normal)
    }

    private func setupButtonState(stateButton: ButtonState, button: UIButton) {
        setDefaultImages()
        switch stateButton {
        case .standart:
            button.setImage(UIImage(systemName: Constants.chevronUpImage), for: .normal)
            buttonState = .up
        case .up:
            button.setImage(UIImage(systemName: Constants.chevronDownImage), for: .normal)
            buttonState = .down
        case .down:
            button.setImage(UIImage(systemName: Constants.chevronUpDownImage), for: .normal)
            buttonState = .standart
        }
    }
}
