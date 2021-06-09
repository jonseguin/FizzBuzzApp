//
//  FizzBuzz.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation

enum FizzBuzzFieldType: CaseIterable, Hashable {
    case fizzValue
    case buzzValue
    case fizzText
    case buzzText
    case limit
}

struct FizzBuzz {
    var fizzValue: Int
    var buzzValue: Int
    var fizzText: String
    var buzzText: String
    var limit: Int

    static let `default` = FizzBuzz(
        fizzValue: 3,
        buzzValue: 5,
        fizzText: "Fizz",
        buzzText: "Buzz",
        limit: 100
    )
}
