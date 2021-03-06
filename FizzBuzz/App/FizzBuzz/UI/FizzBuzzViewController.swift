//
//  FizzBuzzViewController.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 07/06/2021.
//

import Foundation
import UIKit

private enum Constants {
    static let defaultMargin: CGFloat = 16.0
    static let defaultSpacing: CGFloat = 12.0
}

class FizzBuzzViewController: UIViewController,
                              FizzBuzzViewContract,
                              UITextFieldDelegate {

    var presenter: FizzBuzzPresenter?

    private lazy var fizzNumberField = createNumberField(placeholder: NSLocalizedString("fizz_value_textfield_placeholder", comment: ""))
    private lazy var buzzNumberField = createNumberField(placeholder: NSLocalizedString("buzz_value_textfield_placeholder", comment: ""))
    private lazy var limitNumberField = createNumberField(placeholder: NSLocalizedString("limit_textfield_placeholder", comment: ""))
    private lazy var fizzTextField = createTextField(placeholder: NSLocalizedString("fizz_text_textfield_placeholder", comment: ""))
    private lazy var buzzTextField = createTextField(placeholder: NSLocalizedString("buzz_text_textfield_placeholder", comment: ""))
    private lazy var resultLabel = createResultLabel()
    private var editingTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.start()
    }

    // MARK: - FizzBuzzViewContract

    func display(viewModel: FizzBuzzViewModel) {
        resultLabel.text = viewModel.result
    }

    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = .white
        title = NSLocalizedString("fizz_buzz_title", comment: "")
        setupRightBarButton()

        let stackView = createStackView()
        let scrollView = UIScrollView()
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)

        [fizzNumberField, buzzNumberField, limitNumberField, fizzTextField, buzzTextField, resultLabel].forEach {
            stackView.addArrangedSubview($0)
        }

        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        stackView.setCustomSpacing(Constants.defaultSpacing*2, after: limitNumberField)
        stackView.setCustomSpacing(Constants.defaultSpacing*2, after: buzzTextField)
        stackView.topAnchor
            .constraint(equalTo: scrollView.topAnchor, constant: Constants.defaultMargin)
            .isActive = true
        stackView.leftAnchor
            .constraint(equalTo: scrollView.leftAnchor, constant: Constants.defaultMargin)
            .isActive = true
        stackView.rightAnchor
            .constraint(equalTo: scrollView.rightAnchor, constant: -Constants.defaultMargin)
            .isActive = true
        stackView.bottomAnchor
            .constraint(equalTo: scrollView.bottomAnchor, constant: -Constants.defaultMargin)
            .isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.widthAnchor
            .constraint(equalTo: scrollView.widthAnchor, constant: -2*Constants.defaultMargin)
            .isActive = true
    }

    private func setupRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chart.pie.fill"),
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButton)
        )
    }

    private func createNumberField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.returnKeyType = .next
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textField.placeholder = placeholder
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        textField.addTarget(self, action: #selector(textEditingDidEnd), for: .editingDidEnd)
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        return textField
    }

    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .alphabet
        textField.returnKeyType = .done
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textField.placeholder = placeholder
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        textField.addTarget(self, action: #selector(textEditingDidEnd), for: .editingDidEnd)
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        return textField
    }

    private func createResultLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Constants.defaultSpacing
        return stackView
    }

    @objc private func textDidChange(_ textField: UITextField) {
        editingTextField = textField
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

    @objc private func textEditingDidEnd(_ textField: UITextField) {
        guard let editingTextField = editingTextField else { return }
        switch editingTextField {
        case fizzNumberField:
            presenter?.didEndEditingWithUpdate(fieldType: .fizzValue)
        case buzzNumberField:
            presenter?.didEndEditingWithUpdate(fieldType: .buzzValue)
        case fizzTextField:
            presenter?.didEndEditingWithUpdate(fieldType: .fizzText)
        case buzzTextField:
            presenter?.didEndEditingWithUpdate(fieldType: .buzzText)
        case limitNumberField:
            presenter?.didEndEditingWithUpdate(fieldType: .limit)
        default:
            break
        }
        self.editingTextField = nil
    }

    @objc private func didTapRightBarButton() {
        presenter?.didTapStatisticsButton()
    }
}
