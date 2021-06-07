//
//  FizzBuzzPresenter.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

protocol FizzBuzzPresenter: AnyObject {
    func didUpdate(text: String, fieldType: FizzBuzzFieldType)
}
