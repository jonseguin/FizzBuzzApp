//
//  ChartViewController.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 09/06/2021.
//

import UIKit

class ChartViewController: UIViewController,
                           ChartViewContract,
                           UITableViewDataSource {

    var presenter: ChartPresenter?

    private lazy var tableView = createTableView()
    private var viewModel = ChartViewModel.empty

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.start()
    }

    // MARK: - ChartViewContract

    func display(viewModel: ChartViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.cells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ChartTableViewCell.identifier) as? ChartTableViewCell
        cell?.configure(with: viewModel)
        return cell ?? UITableViewCell()
    }

    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = .white
        title = NSLocalizedString("chart_title", comment: "")

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(ChartTableViewCell.self, forCellReuseIdentifier: ChartTableViewCell.identifier)
        tableView.allowsSelection = false
        return tableView
    }
}
