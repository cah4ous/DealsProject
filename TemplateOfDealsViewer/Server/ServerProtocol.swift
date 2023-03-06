// ServerProtocol.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Протокол сервера
protocol ServerProtocol {
    func subscribeToDeals(callback: @escaping ([Deal]) -> Void)
}
