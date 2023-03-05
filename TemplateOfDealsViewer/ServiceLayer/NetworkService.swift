// NetworkService.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Cетевой слой
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Private Properties

    private var server: ServerProtocol

    // MARK: - Initializers

    init(server: ServerProtocol) {
        self.server = server
    }

    // MARK: - Public Methods

    func fetchDeals(completion: @escaping (Result<[Deal], Error>) -> Void) {
        server.subscribeToDeals { deals in
            completion(.success(deals))
        }
    }
}
