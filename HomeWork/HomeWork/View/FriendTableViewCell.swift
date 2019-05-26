//
//  FruitTableViewCell.swift
//  HomeWork
//
//  Created by Ajay Odedra on 03/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import UIKit

class FruitTableViewCell: UITableViewCell {

    var viewModel: FruitCellViewModel? {
        didSet {
            bindViewModel()
        }
    }

    private func bindViewModel() {
        textLabel?.text = viewModel?.fruitName.uppercased()
    }
}

