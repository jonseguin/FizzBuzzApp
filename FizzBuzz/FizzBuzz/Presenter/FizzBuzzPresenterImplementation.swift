//
//  FizzBuzzPresenterImplementation.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation

class FizzBuzzPresenterImplementation: FizzBuzzPresenter {

    private weak var viewContract: FizzBuzzViewContract?
    private let getFizzBuzzResultInteractor: GetFizzBuzzResultInteractor
    private var fizzBuzz = FizzBuzz.default

    init(viewContract: FizzBuzzViewContract,
         getFizzBuzzResultInteractor: GetFizzBuzzResultInteractor) {
        self.viewContract = viewContract
        self.getFizzBuzzResultInteractor = getFizzBuzzResultInteractor
    }

    // MARK: - FizzBuzzPresenter

    func start() {
        reloadViewModel()
    }

    func didUpdate(fieldType: FizzBuzzFieldType, with text: String?) {
        guard let text = text else { return }
        switch fieldType {
        case .fizzValue:
            fizzBuzz.fizzValue = Int(text) ?? 3
        case .buzzValue:
            fizzBuzz.buzzValue = Int(text) ?? 5
        case .fizzText:
            fizzBuzz.fizzText = text
        case .buzzText:
            fizzBuzz.buzzText = text
        case .limit:
            fizzBuzz.limit = Int(text) ?? 100
        }
        reloadViewModel()
    }

    // MARK: - Private

    private func reloadViewModel() {
        getFizzBuzzResultInteractor.execute(fizzBuzz) { [weak self] result in
            let viewModel = FizzBuzzViewModel(result: result)
            self?.viewContract?.display(viewModel: viewModel)
        }
    }
}
