//
//  Constants.swift
//  HomeWork
//
//  Created by Ajay Odedra on 04/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import UIKit

public enum GlobalConstants {
    
    enum URL {
        static let baseUrl = "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/"

        enum Api {
            static let fruits = baseUrl + "data.json"
            static let stats = baseUrl +  "stats?"
        }
    }
}


