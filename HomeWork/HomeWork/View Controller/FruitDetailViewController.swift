//
//  FruitDetailViewController.swift
//  HomeWork
//
//  Created by Ajay Odedra on 04/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import UIKit

class FruitDetailViewController: UIViewController {
    
    @IBOutlet weak var fruitNameLbl: UILabel!
    @IBOutlet weak var fruitPriceLbl: UILabel!
    @IBOutlet weak var fruitWeightLbl: UILabel!
    
    private(set) var detailViewModel: FruitDetailViewModel?
    
    var fruit: Fruit? {
        didSet {
            guard let fruit = fruit else {
                detailViewModel?.errorStats(desc: "Failed to load detail screen due to nil object detail")
                return
            }
            detailViewModel = FruitDetailViewModel.init(fruit: fruit)
            DispatchQueue.main.async {
                self.updateLabelUI()
                self.updateLabels()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel?.createdAt = Date()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FruitDetailViewController {
    
    
    private func updateLabelUI() {
        fruitNameLbl.backgroundColor = .random()
        fruitPriceLbl.backgroundColor = .random()
        fruitWeightLbl.backgroundColor = .random()
    }
    
    private func updateLabels() {
        
        guard let viewModel = detailViewModel else {
            detailViewModel?.errorStats(desc: "Failed to load detail screen due to nil object detail")
            return
        }
        
        fruitNameLbl.text = viewModel.nameString
        fruitPriceLbl.text = viewModel.priceString
        fruitWeightLbl.text = viewModel.weightString
        viewModel.displayStats()
        
    }
}

