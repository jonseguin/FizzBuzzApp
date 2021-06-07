//
//  FizzBuzzViewController.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation
import UIKit

class FizzBuzzViewController: UIViewController, FizzBuzzViewContract {

    var presenter: FizzBuzzPresenter?

    private lazy var fizzNumberField = createNumberField(placeholder: NSLocalizedString("fizz_value_textfield_placeholder", comment: ""))
    private lazy var buzzNumberField = createNumberField(placeholder: NSLocalizedString("buzz_value_textfield_placeholder", comment: ""))
    private lazy var limitNumberField = createNumberField(placeholder: NSLocalizedString("limit_textfield_placeholder", comment: ""))
    private lazy var fizzTextField = createTextField(placeholder: NSLocalizedString("fizz_text_textfield_placeholder", comment: ""))
    private lazy var buzzTextField = createTextField(placeholder: NSLocalizedString("buzz_text_textfield_placeholder", comment: ""))
    private lazy var resultLabel = createResultLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.start()
    }

    // MARK: - FizzBuzzViewContract

    func display(viewModel: FizzBuzzViewModel) {
        resultLabel.text = viewModel.result
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
        resultLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func createNumberField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.returnKeyType = .next
        textField.backgroundColor = .yellow.withAlphaComponent(0.3)
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textField.placeholder = placeholder
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return textField
    }

    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .alphabet
        textField.returnKeyType = .next
        textField.backgroundColor = .green.withAlphaComponent(0.3)
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textField.placeholder = placeholder
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return textField
    }

    private func createResultLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .red.withAlphaComponent(0.3)
        return label
    }

    @objc private func textDidChange(_ textField: UITextField) {
        switch textField {
        case fizzNumberField:
            presenter?.didUpdate(fieldType: .fizzValue, with: textField.text)
        case buzzNumberField:
            presenter?.didUpdate(fieldType: .buzzValue, with: textField.text)
        case fizzTextField:
            presenter?.didUpdate(fieldType: .fizzText, with: textField.text)
        case buzzTextField:
            presenter?.didUpdate(fieldType: .buzzText, with: textField.text)
        case limitNumberField:
            presenter?.didUpdate(fieldType: .limit, with: textField.text)
        default:
            break
        }
    }
}
