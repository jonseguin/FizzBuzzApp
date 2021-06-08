//
//  TextFieldTrackingRepository.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 08/06/2021.
//

import Foundation

protocol TextFieldTrackingRepository: AnyObject {
    func incrementHit(for fieldType: FizzBuzzFieldType)
    func getHitsCount(for fieldType: FizzBuzzFieldType) -> Int
}
