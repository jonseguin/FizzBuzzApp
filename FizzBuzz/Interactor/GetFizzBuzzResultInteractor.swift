//
//  GetFizzBuzzResultInteractor.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation

protocol GetFizzBuzzResultInteractor: AnyObject {
    func execute(_ fizzBuzz: FizzBuzz, completion: (String) -> Void)
}
