//
//  FilterParams.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 1.10.24.
//

import Foundation

struct FilterParams {
    
    enum Sex {
        case man
        case woman
        
        func getString() -> String {
            switch self {
            case .man: return "man"
            case .woman: return "woman"
            }
        }
    }
    
    enum ClothesType {
        case shirt
        case trousers
        
        func getString() -> String {
            switch self {
            case .shirt: return "shirt"
            case .trousers: return "trousers"
            }
        }
    }
    
    let sex: Sex
    let type: ClothesType
    let price: Double
    
}
