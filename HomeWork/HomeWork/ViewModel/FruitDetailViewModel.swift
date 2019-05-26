//
//  FruitDetailViewModel.swift
//  HomeWork
//
//  Created by Ajay Odedra on 05/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import Foundation

struct FruitDetailViewModel {
    
    let currentFruit: Fruit
    private(set) var nameString = ""
    private(set) var priceString = ""
    private(set) var weightString = ""
    
    var createdAt = Date()
    
    // API INIT
    let appServerClient: AppServerClient
    
    
    init(fruit: Fruit) {
        self.currentFruit = fruit
        self.appServerClient = AppServerClient()
        updateProperties()
    }
    
    // LOG Display
    func displayStats(){
        let ms = Date().millSecs(from: createdAt)
        let url = GlobalConstants.URL.Api.stats + "event=display&data=\(ms)"
        appServerClient.logStats(url: url)
    }
    
    func errorStats(desc:String){
        let url = GlobalConstants.URL.Api.stats + "event=error&data=\(desc)"
        appServerClient.logStats(url: url)
    }
    
    private mutating func updateProperties() {
        nameString = currentFruit.fruitName.uppercased()
        priceString = "Price\n£\(currentFruit.fruitPrice)"
        weightString = "Weight\n\(currentFruit.fruitWeight) kg"
    }
    
}
