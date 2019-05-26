//
//  FruitsTableViewModel.swift
//  HomeWork
//
//  Created by Ajay Odedra on 04/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import Foundation

class FruitsTableViewViewModel {
    
    enum FruitTableViewCellType {
        case normal(cellViewModel: FruitCellViewModel)
        case error(message: String)
        case empty
    }
    
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    
    let fruitCells = Bindable([FruitTableViewCellType]())
    var createdAt = Date()
    
    // API INIT
    let appServerClient: AppServerClient
    
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    // LOG Display
    func displayStats(){
        let ms = Date().millSecs(from: createdAt)
        let url = GlobalConstants.URL.Api.stats + "event=display&data=\(ms)"
        appServerClient.logStats(url: url)
    }
    
    func getFruits() {
        showLoadingHud.value = true
        appServerClient.getFruits(completion: { [weak self] result in
            self?.showLoadingHud.value = false
            switch result {
            case .success(let fruits):
                guard fruits.count > 0 else {
                    self?.fruitCells.value = [.empty]
                    return
                }
                self?.fruitCells.value = fruits.compactMap {
                    .normal(cellViewModel: $0 as FruitCellViewModel)
                }
            case .failure(let error):
                self?.fruitCells.value = [.error(message: error?.localizedDescription ?? "Error occurred")]
            }
        })
    }
    
}

