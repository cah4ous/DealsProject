// String+Extension.swift
// Copyright © Alexandr T. All rights reserved.

import Foundation

/// Добавление разделения строки на подстроки
extension String {
    var length: Int {
        count
    }

    subscript(item: Int) -> String {
        self[item ..< item + 1]
    }

    func substring(fromIndex: Int) -> String {
        self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        self[0 ..< max(0, toIndex)]
    }

    subscript(item: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (
            lower: max(0, min(length, item.lowerBound)),
            upper: min(length, max(0, item.upperBound))
        ))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
