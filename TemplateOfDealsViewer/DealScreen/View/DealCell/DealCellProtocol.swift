// DealCellProtocol.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Протокол ячейки сделки
protocol DealCellProtocol {
    func configure(instrumentName: String, priceValue: Double, amountValue: Double, side: Side)
}
