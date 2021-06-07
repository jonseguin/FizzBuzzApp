//
//  FizzBuzzViewController.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import UIKit

class FizzBuzzViewController: UIViewController {

    private lazy var fizzNumberField = createNumberField()
    private lazy var buzzNumberField = createNumberField()
    private lazy var limitNumberField = createNumberField()
    private lazy var fizzTextField = createTextField()
    private lazy var buzzTextField = createTextField()
    private lazy var resultLabel = createResultLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = .white
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12.0
        view.addSubview(stackView)

        [fizzNumberField, buzzNumberField, limitNumberField, fizzTextField, buzzTextField].forEach {
            stackView.addArrangedSubview($0)
        }
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(resultLabel)
        resultLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16.0).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0).isActive = true
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func createNumberField() -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .yellow.withAlphaComponent(0.3)
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return textField
    }

    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .alphabet
        textField.backgroundColor = .green.withAlphaComponent(0.3)
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return textField
    }

    private func createResultLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .red.withAlphaComponent(0.3)
        return label
    }
}

