//
//  GetFizzBuzzResultInteractorImplementation.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation

class GetFizzBuzzResultInteractorImplementation: GetFizzBuzzResultInteractor {

    func execute(_ fizzBuzz: FizzBuzz, completion: (String) -> Void) {
        let fizzBuzzResult = (1..<fizzBuzz.limit+1).reduce(into: "") { result, index in
            var isFizz = false, isBuzz = false
            if index%fizzBuzz.fizzValue == 0 {
                result += fizzBuzz.fizzText
                isFizz = true
            }
            if index%fizzBuzz.buzzValue == 0 {
                result += fizzBuzz.buzzText
                isBuzz = true
            }
            if !isFizz && !isBuzz {
                result += "\(index)"
            }
            if index != fizzBuzz.limit {
                result += ","
            }
        }
        completion(fizzBuzzResult)
    }

}
