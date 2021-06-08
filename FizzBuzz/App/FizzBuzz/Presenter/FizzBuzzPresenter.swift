//
//  FizzBuzzPresenter.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

protocol FizzBuzzPresenter: AnyObject {
    func start()
    func didUpdate(fieldType: FizzBuzzFieldType, with text: String?)
    func didTapStatisticsButton()
}

protocol FizzBuzzPresenterDelegate: AnyObject {
    func fizzBuzzPresenterDidRequestStatistics(_ presenter: FizzBuzzPresenter)
}
