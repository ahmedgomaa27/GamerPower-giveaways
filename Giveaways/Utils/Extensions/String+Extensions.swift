//
//  String+Extensions.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 03/06/2024.
//

import Foundation

let baseDateFormatter = DateFormatter()

extension String {
    func formattedDate(dateFormat: String = "yyyy-MM-DD HH:mm:ss") -> String {
        baseDateFormatter.dateFormat = dateFormat
        return (baseDateFormatter.date(from: self) ?? Date()).formatted(date: .numeric, time: .omitted)
    }
}
