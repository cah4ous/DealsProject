// NetworkServiceProtocol.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Протокол сетевого слоя
protocol NetworkServiceProtocol {
    func fetchDeals(completion: @escaping (Result<[Deal], Error>) -> Void)
}
