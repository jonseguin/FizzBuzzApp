//
//  ChartTableViewCell.swift
//  FizzBuzz
//
//  Created by Jonathan Seguin on 09/06/2021.
//

import UIKit

class ChartTableViewCell: UITableViewCell {


    func configure(with viewModel: ChartCellViewModel) {
    }
}


extension UITableViewCell {

    static var identifier: String {
        String(describing: self)
    }
}
