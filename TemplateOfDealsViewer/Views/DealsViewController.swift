// DealsViewController.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Экран сделок
final class DealsViewController: UIViewController {
    // MARK: - Private Enums

    private enum Constants {
        static let navigationTitleText = "Deals"
        static let fatalErrorText = "init(coder:) has not been implemented"
        static let numberOfSections = 1
    }

    private enum OperationType {
        case instruments
        case price
        case amount
        case side
    }

    // MARK: - Private Visual Components

    private var tableView = UITableView()

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private var deals: [Deal] = []

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }

    // MARK: - Private Methods

    private func initMethods() {
        setupUI()
        loadDeals()
    }

    private func setupUI() {
        createTableViewSettings()
        setupNavigationSettings()
        view.backgroundColor = .white
    }

    private func createTableViewSettings() {
        tableView.register(
            UINib(nibName: DealCell.reuseIidentifier, bundle: nil),
            forCellReuseIdentifier: DealCell.reuseIidentifier
        )
        tableView.register(
            UINib(nibName: HeaderCell.reuseIidentifier, bundle: nil),
            forHeaderFooterViewReuseIdentifier: HeaderCell.reuseIidentifier
        )

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        createTableViewConstraints()
    }

    private func createTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: 0
        ).isActive = true
        tableView.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: 0
        ).isActive = true
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 0
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: 10
        ).isActive = true
    }

    private func setupNavigationSettings() {
        navigationItem.title = Constants.navigationTitleText
    }

    private func loadDeals() {
        networkService.fetchDeals { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(deals):
                self.deals.append(contentsOf: deals)
                self.tableView.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func setDefaultSettings(result: ButtonState, typeOperation: OperationType) {
        switch result {
        case .standart:
            deals = deals.sorted { first, second in
                first.dateModifier > second.dateModifier
            }
        case .up:
            switch typeOperation {
            case .instruments:
                deals = deals.sorted { first, second in
                    first.instrumentName > second.instrumentName
                }
            case .price:
                deals = deals.sorted { first, second in
                    first.price > second.price
                }
            case .amount:
                deals = deals.sorted { first, second in
                    first.amount > second.amount
                }
            case .side:
                deals = deals.sorted { first, second in
                    first.side.hashValue > second.side.hashValue
                }
            }
        case .down:
            switch typeOperation {
            case .instruments:
                deals = deals.sorted { first, second in
                    first.instrumentName < second.instrumentName
                }
            case .price:
                deals = deals.sorted { first, second in
                    first.price < second.price
                }
            case .amount:
                deals = deals.sorted { first, second in
                    first.amount < second.amount
                }
            case .side:
                deals = deals.sorted { first, second in
                    first.side.hashValue < second.side.hashValue
                }
            }
        }
        tableView.reloadData()
    }

    private func headerTest(headerCell: HeaderCell) {
        headerCell.instrumentHandler = { [weak self] result in
            self?.setDefaultSettings(result: result, typeOperation: .instruments)
        }

        headerCell.priceHandler = { [weak self] result in
            self?.setDefaultSettings(result: result, typeOperation: .price)
        }

        headerCell.amountHandler = { [weak self] result in
            self?.setDefaultSettings(result: result, typeOperation: .amount)
        }

        headerCell.sideHandler = { [weak self] result in
            self?.setDefaultSettings(result: result, typeOperation: .side)
        }
    }
}

/// UITableViewDataSource, UITableViewDelegate
extension DealsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        deals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: DealCell.reuseIidentifier, for: indexPath) as? DealCell
        else { return UITableViewCell() }
        let sortedDeal = deals.sorted { first, second in
            first.instrumentName > second.instrumentName
        }
        let currentDeal = sortedDeal[indexPath.row]
        cell.configure(
            instrumentName: currentDeal.instrumentName,
            priceValue: currentDeal.price,
            amountValue: currentDeal.amount,
            side: currentDeal.side
        )
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: HeaderCell.reuseIidentifier) as? HeaderCell
        else { return UITableViewCell() }
        headerTest(headerCell: headerCell)
        return headerCell
    }
}
