//
//  ChartViewModelMapper.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 09/06/2021.
//

import Foundation

struct ChartViewModelMapper {

    let allHitsCount: [FizzBuzzFieldType: Int]
    let totalHitsCount: Int

    func map() -> ChartViewModel {
        let cells = allHitsCount.keys.map {
            mapCell(fieldType: $0, hitsCount: allHitsCount[$0] ?? 0)
        }
        return ChartViewModel(cells: cells)
    }

    // MARK: - Private

    private func mapCell(fieldType: FizzBuzzFieldType, hitsCount: Int) -> ChartCellViewModel {
        return ChartCellViewModel(
            title: fieldType.title,
            numberHits: hitsCount,
            totalHits: totalHitsCount
        )
    }
}

private extension FizzBuzzFieldType {

    var title: String {
        switch self {
        case .fizzText:
            return NSLocalizedString("fizz_text_title", comment: "")
        case .buzzText:
            return NSLocalizedString("buzz_text_title", comment: "")
        case .fizzValue:
            return NSLocalizedString("fizz_value_title", comment: "")
        case .buzzValue:
            return NSLocalizedString("buzz_value_title", comment: "")
        case .limit:
            return NSLocalizedString("limit_title", comment: "")
        }
    }
}
