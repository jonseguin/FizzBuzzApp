//
//  ChartPresenterImplementation.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 09/06/2021.
//

import Foundation

class ChartPresenterImplementation: ChartPresenter {

    private weak var viewContract: ChartViewContract?
    private let textFieldTrackingRepository: TextFieldTrackingRepository

    init(viewContract: ChartViewContract,
         textFieldTrackingRepository: TextFieldTrackingRepository) {
        self.viewContract = viewContract
        self.textFieldTrackingRepository = textFieldTrackingRepository
    }

    func start() {
        let totalHitsCount = textFieldTrackingRepository.getTotalHitsCount()
        var allHitsCount: [FizzBuzzFieldType: Int] = [:]
        FizzBuzzFieldType.allCases.forEach {
            allHitsCount[$0] = textFieldTrackingRepository.getHitsCount(for: $0)
        }
        let viewModel = ChartViewModelMapper(allHitsCount: allHitsCount, totalHitsCount: totalHitsCount).map()
        viewContract?.display(viewModel: viewModel)
    }
}
