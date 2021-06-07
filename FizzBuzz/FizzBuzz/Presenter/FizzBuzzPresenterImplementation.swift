//
//  FizzBuzzPresenterImplementation.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation

class FizzBuzzPresenterImplementation: FizzBuzzPresenter {

    private weak var viewContract: FizzBuzzViewContract?
    private var fizzBuzz = FizzBuzz.default

    init(viewContract: FizzBuzzViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - FizzBuzzPresenter

    func didUpdate(text: String, fieldType: FizzBuzzFieldType) {
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
    }
}
