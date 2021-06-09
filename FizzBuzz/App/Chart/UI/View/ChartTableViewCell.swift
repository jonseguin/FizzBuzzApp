//
//  ChartTableViewCell.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 09/06/2021.
//

import UIKit

class ChartTableViewCell: UITableViewCell {

    private lazy var titleLabel = createTitleLabel()
    private lazy var hitsCountLabel = createHitsCountLabel()
    private lazy var slider = createSlider()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func configure(with viewModel: ChartCellViewModel) {
        titleLabel.text = viewModel.title
        hitsCountLabel.text = "\(viewModel.numberHits)"
        slider.maximumValue = Float(viewModel.totalHits)
        slider.value = Float(viewModel.numberHits)
    }

    // MARK: - Private

    private func setup() {
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16.0).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(hitsCountLabel)
        hitsCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0).isActive = true
        hitsCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.0).isActive = true
        hitsCountLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16.0).isActive = true
        hitsCountLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        hitsCountLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(slider)
        slider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        slider.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 8.0).isActive = true
        slider.rightAnchor.constraint(equalTo: hitsCountLabel.leftAnchor, constant: -8.0).isActive = true
        slider.translatesAutoresizingMaskIntoConstraints = false
    }

    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }

    private func createHitsCountLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }

    private func createSlider() -> UISlider {
        let slider = UISlider()
        slider.setThumbImage(UIImage(), for: .normal)
        slider.isUserInteractionEnabled = false
        return slider
    }
}


extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}
