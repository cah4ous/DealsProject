// DealsViewController.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Экран сделок
final class DealsViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var tableView: UITableView!

    // MARK: - Private Properties

    private let server = Server()
    private var model: [Deal] = []

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
    }

    private func setupUI() {
        createTableViewSettings()
        navigationItem.title = "Deals"
    }

    private func loadDeals() {
        server.subscribeToDeals { deals in
            self.model.append(contentsOf: deals)
            self.tableView.reloadData()
        }
    }
}

/// UITableViewDataSource, UITableViewDelegate
extension DealsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: DealCell.reuseIidentifier, for: indexPath) as? DealCell
        else { return UITableViewCell() }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: HeaderCell.reuseIidentifier) as? HeaderCell
        else { return UITableViewCell() }
        return cell
    }
}
