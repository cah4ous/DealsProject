// HeaderCell.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// header cell
class HeaderCell: UITableViewHeaderFooterView {
    static let reuseIidentifier = "HeaderCell"

    @IBOutlet var instrumentNameTitlLabel: UILabel!
    @IBOutlet var priceTitleLabel: UILabel!
    @IBOutlet var amountTitleLabel: UILabel!
    @IBOutlet var sideTitleLabel: UILabel!
}
