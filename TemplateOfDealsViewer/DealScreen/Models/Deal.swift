// Deal.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Сделка
struct Deal {
    /// Идентификатор
    let id: Int64
    /// Дата изменения
    let dateModifier: Date
    /// Имя инструмента
    let instrumentName: String
    /// Цена
    let price: Double
    /// Объем
    let amount: Double
    /// Cторона
    let side: Side
}

/// Тип формата стороны сделки
enum Side: CaseIterable {
    case sell, buy
}
