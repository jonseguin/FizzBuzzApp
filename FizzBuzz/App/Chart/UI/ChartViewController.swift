//
//  ChartViewController.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 09/06/2021.
//

import UIKit

class ChartViewController: UIViewController, ChartViewContract {

    var presenter: ChartPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.start()
    }

    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = .white
        title = NSLocalizedString("chart_title", comment: "")
    }
}
