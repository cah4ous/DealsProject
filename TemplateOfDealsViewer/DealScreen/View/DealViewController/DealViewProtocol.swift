// DealViewProtocol.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Протокол вью фильма
protocol DealViewProtocol: AnyObject {
    func success(deals: [Deal])
    func failure(error: Error)
}
