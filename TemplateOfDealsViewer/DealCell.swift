// DealCell.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Ячейка сделки
class DealCell: UITableViewCell {
    static let reuseIidentifier = "DealCell"

    @IBOutlet var instrumentNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var sideLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
