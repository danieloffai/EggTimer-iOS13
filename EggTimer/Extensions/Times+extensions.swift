//
//  Times+extensions.swift
//  EggTimer
//
//  Created by Daniel Lyubenov on 2.04.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

extension ViewController.Times {
    
    func timeForButton() -> Int {
        switch self {
        case .soft:
            return 30 //300
        case .medium:
            return 40 //420
        case .hard:
            return 70 //700
        }
    }
    
    func name() -> String {
        switch self {
        case .soft:
            return "Soft"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
}
