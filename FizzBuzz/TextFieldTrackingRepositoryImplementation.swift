//
//  TextFieldTrackingRepositoryImplementation.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 08/06/2021.
//

import Foundation

class TextFieldTrackingRepositoryImplementation: TextFieldTrackingRepository {

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func incrementHit(for fieldType: FizzBuzzFieldType) {
        let actualCount = getHitsCount(for: fieldType)
        userDefaults.set(actualCount + 1, forKey: key(for: fieldType))
    }

    func getHitsCount(for fieldType: FizzBuzzFieldType) -> Int {
        return userDefaults.integer(forKey: key(for: fieldType))
    }

    // MARK: - Private

    private func key(for fieldType: FizzBuzzFieldType) -> String {
        return "TextFieldTracking.\(fieldType.userDefaultKey)"
    }
}

private extension FizzBuzzFieldType {

    var userDefaultKey: String {
        switch self {
        case .fizzValue:
            return "FizzValue"
        case .buzzValue:
            return "BuzzValue"
        case .fizzText:
            return "FizzText"
        case .buzzText:
            return "BuzzText"
        case .limit:
            return "Limit"
        }
    }
}
