// Server.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Сервер
final class Server: ServerProtocol {
    let queue = DispatchQueue(label: "DealsMakeQueue")
    let instrumentNames = [
        "EUR/USD_TOD",
        "GBP/USD_SPOT",
        "USD/JPY_TOM",
        "USD/CHF_SPOT",
        "USD/GBP_SPOT",
        "USD/CAD_TOM",
        "USD/RUB_TOM",
        "EUR/RUB_TOD",
        "CHF/RUB_TOM",
        "USD/AMD_SPOT",
        "EUR/GEL_SPOT",
        "UAH/RUB_SPOT",
        "USD/RUB_ON",
        "EUR/USD_TN"
    ]

    func subscribeToDeals(callback: @escaping ([Deal]) -> Void) {
        queue.async {
            var deals: [Deal] = []
            let dealsCount = Int64.random(in: 1_000_000 ..< 1_001_000)
            let dealsCountInPacket = 100
            var dealCounter = 0
            for dealItem in 0 ... dealsCount {
                let currentTimeStamp = Date().timeIntervalSince1970
                let timeStampRandomizer = Double.random(in: 50000 ... 50_000_000)
                let deal = Deal(
                    id: dealItem,
                    dateModifier: Date(
                        timeIntervalSince1970: Double
                            .random(in: currentTimeStamp - timeStampRandomizer ... currentTimeStamp)
                    ),
                    instrumentName: self.instrumentNames.shuffled().first ?? "",
                    price: Double.random(in: 60 ... 70),
                    amount: Double.random(in: 1_000_000 ... 50_000_000),
                    side: Side.allCases.randomElement() ?? .buy
                )
                deals.append(deal)

                dealCounter += 1

                if dealCounter == dealsCountInPacket || dealItem == dealsCount {
                    dealCounter = 0
                    let delay = UInt32.random(in: 0 ... 300_000)
                    usleep(delay)
                    let newDeals = deals
                    DispatchQueue.main.async {
                        callback(newDeals)
                    }
                    deals = []
                }
            }
        }
    }
}
