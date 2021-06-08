//
//  HomeRouter.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 08/06/2021.
//

import UIKit

class HomeRouter {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = FizzBuzzViewController()
        let presenter = FizzBuzzPresenterImplementation(
            viewContract: viewController,
            getFizzBuzzResultInteractor: GetFizzBuzzResultInteractorImplementation()
        )
        viewController.presenter = presenter

        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
