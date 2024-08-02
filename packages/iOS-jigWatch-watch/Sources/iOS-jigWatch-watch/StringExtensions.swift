//
//  StringExtensions.swift
//

extension StringProtocol {
    var lines: [SubSequence] { split(whereSeparator: \.isNewline) }
}
