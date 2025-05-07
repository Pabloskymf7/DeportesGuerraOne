//
//  StringExtensions.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/5/25.
//

import Foundation

extension String {
    func formatedByParenthesis() -> String {
        let sentences = self
            .components(separatedBy: ". ")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        let numbered = sentences.enumerated().map { index, sentence in
            "\(index + 1): \(sentence)."
        }

        return numbered.joined(separator: "\n")
    }
}

