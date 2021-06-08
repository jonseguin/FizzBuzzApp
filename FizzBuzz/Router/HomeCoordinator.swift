//
//  HomeCoordinator.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 08/06/2021.
//

import UIKit

class HomeCoordinator: NSObject, FizzBuzzPresenterDelegate {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = FizzBuzzViewController()
        let presenter = FizzBuzzPresenterImplementation(
            viewContract: viewController,
            delegate: self,
            getFizzBuzzResultInteractor: GetFizzBuzzResultInteractorImplementation(),
            textFieldTrackingRepository: TextFieldTrackingRepositoryImplementation()
        )
        viewController.presenter = presenter

        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    // MARK: - FizzBuzzPresenterDelegate

    func fizzBuzzPresenterDidRequestStatistics(_ presenter: FizzBuzzPresenter) {
        // TODO Handle opening of statistics VC
    }
}
