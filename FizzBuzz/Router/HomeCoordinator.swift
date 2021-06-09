//
//  HomeCoordinator.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 08/06/2021.
//

import UIKit

class HomeCoordinator: NSObject, FizzBuzzPresenterDelegate {

    private let window: UIWindow
    private var navigationController: UINavigationController?

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
        self.navigationController = navigationController
    }

    // MARK: - FizzBuzzPresenterDelegate

    func fizzBuzzPresenterDidRequestStatistics(_ presenter: FizzBuzzPresenter) {
        let chartViewController = ChartViewController()
        let presenter = ChartPresenterImplementation(
            viewContract: chartViewController,
            textFieldTrackingRepository: TextFieldTrackingRepositoryImplementation()
        )
        chartViewController.presenter = presenter
        navigationController?.pushViewController(chartViewController, animated: true)
    }
}
