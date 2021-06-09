//
//  ChartViewModel.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 09/06/2021.
//

import Foundation

struct ChartViewModel {
    let cells: [ChartCellViewModel]

    static let empty = ChartViewModel(cells: [])
}

struct ChartCellViewModel {
    let title: String
    let numberHits: Int
    let totalHits: Int
}
