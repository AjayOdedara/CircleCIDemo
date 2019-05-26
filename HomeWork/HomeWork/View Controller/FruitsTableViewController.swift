//
//  FruitsTableViewController.swift
//  HomeWork
//
//  Created by Ajay Odedra on 03/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import UIKit
import PKHUD

class FruitsTableViewController: UITableViewController {
    
    let viewModel: FruitsTableViewViewModel = FruitsTableViewViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.createdAt = Date()
        bindViewModel()
        viewModel.getFruits()
        
    }
    
    func bindViewModel() {
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        print("bindAndFire Start")
        viewModel.fruitCells.bindAndFire() { [weak self] _ in
            
            print("bindAndFire Compelete")
            self?.tableView?.reloadData()
            
        }
        
        print("onShowError Start")
        viewModel.onShowError = { [weak self] alert in
            print("onShowError Compelete")
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        print("showLoadingHud Start")
        viewModel.showLoadingHud.bind() { [weak self] visible in
            if let `self` = self {
                print("showLoadingHud Compelete and HUD is \(visible)")
                PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
                if visible{
                    PKHUD.sharedHUD.show(onView: self.view)
                }else{
                    self.viewModel.displayStats()
                    PKHUD.sharedHUD.hide()
                }
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fruitDetailView",
            let destinationViewController = segue.destination as? FruitDetailViewController {
            destinationViewController.title = "Fruit Details"
            guard let index = tableView.indexPathForSelectedRow,
                let cellData = tableView.cellForRow(at: index) as? FruitTableViewCell,
                let model = cellData.viewModel else{
                    return
                }
            
            destinationViewController.fruit = model.fruitItem
            
        }
        
    }
}

// MARK: - UITableView
extension FruitsTableViewController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fruitCells.value.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.fruitCells.value[indexPath.row] {
        case .normal(let viewModel):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIndetity) as? FruitTableViewCell else {
                return UITableViewCell()
            }
            
            cell.accessoryType = .disclosureIndicator
            cell.viewModel = viewModel
            
            return cell
        case .error(let message):
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = message
            return cell
        case .empty:
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = "No data available"
            return cell
        }
    }
    
    
}

extension FruitsTableViewController: SingleButtonDialogPresenter {
}


