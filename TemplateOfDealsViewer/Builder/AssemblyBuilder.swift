// AssemblyBuilder.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Сборщик экранов
final class AssemblyBuilder: AssemblyBuilderProtocol {
    func makeDealModule() -> UIViewController {
        let server = Server()
        let networkService = NetworkService(server: server)
        let view = DealsViewController(networkService: networkService)
        return view
    }
}
