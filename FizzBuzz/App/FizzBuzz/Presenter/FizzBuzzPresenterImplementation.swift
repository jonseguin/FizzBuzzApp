//
//  FizzBuzzPresenterImplementation.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation

class FizzBuzzPresenterImplementation: FizzBuzzPresenter {

    private weak var viewContract: FizzBuzzViewContract?
    private weak var delegate: FizzBuzzPresenterDelegate?
    private let getFizzBuzzResultInteractor: GetFizzBuzzResultInteractor
    private let textFieldTrackingRepository: TextFieldTrackingRepository
    private var fizzBuzz = FizzBuzz.default

    init(viewContract: FizzBuzzViewContract,
         delegate: FizzBuzzPresenterDelegate,
         getFizzBuzzResultInteractor: GetFizzBuzzResultInteractor,
         textFieldTrackingRepository: TextFieldTrackingRepository) {
        self.viewContract = viewContract
        self.delegate = delegate
        self.getFizzBuzzResultInteractor = getFizzBuzzResultInteractor
        self.textFieldTrackingRepository = textFieldTrackingRepository
    }

    // MARK: - FizzBuzzPresenter

    func start() {
        reloadViewModel()
    }

    func didUpdate(fieldType: FizzBuzzFieldType, with text: String?) {
        guard let text = text else { return }
        switch fieldType {
        case .fizzValue:
            fizzBuzz.fizzValue = Int(text) ?? FizzBuzz.default.fizzValue
        case .buzzValue:
            fizzBuzz.buzzValue = Int(text) ?? FizzBuzz.default.buzzValue
        case .fizzText:
            fizzBuzz.fizzText = text.isEmpty ? FizzBuzz.default.fizzText : text
        case .buzzText:
            fizzBuzz.buzzText = text.isEmpty ? FizzBuzz.default.buzzText : text
        case .limit:
            fizzBuzz.limit = Int(text) ?? FizzBuzz.default.limit
        }
        reloadViewModel()
    }

    func didEndEditingWithUpdate(fieldType: FizzBuzzFieldType) {
        textFieldTrackingRepository.incrementHit(for: fieldType)
    }

    func didTapStatisticsButton() {
        delegate?.fizzBuzzPresenterDidRequestStatistics(self)
    }

    // MARK: - Private

    private func reloadViewModel() {
        getFizzBuzzResultInteractor.execute(fizzBuzz) { [weak self] result in
            let viewModel = FizzBuzzViewModel(result: result)
            self?.viewContract?.display(viewModel: viewModel)
        }
    }
}
