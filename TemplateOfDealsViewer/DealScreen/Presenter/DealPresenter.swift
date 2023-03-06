// DealPresenter.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Представление экрана сделок
final class DealPresenter: DealPresenterProtocol {
    // MARK: - Public Properties

    weak var view: DealViewProtocol?

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol?

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    // MARK: - Public Methods

    func fetchDeals() {
        networkService?.fetchDeals { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(deals):
                self.view?.success(deals: deals)
            case let .failure(error):
                self.view?.failure(error: error)
            }
        }
    }
}
