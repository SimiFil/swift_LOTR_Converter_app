//
//  Currency.swift
//  LOTR
//
//  Created by Filip Simandl on 30.07.2024.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    // Function parameters are immutable by default
    func convert(_ amountString: String, to currency: Currency) -> String {
        var mutableAmountString = amountString
        
        if (mutableAmountString.contains(",")) {
            mutableAmountString.replace(",", with: ".")
        }
        
        // guard will try to convert to double in this case, but when it
        guard let doubleAmount = Double(mutableAmountString) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
    
    static func from(identifier: String) -> Currency {
        switch identifier {
        case "Copper Penny": return .copperPenny
        case "Silver Penny": return .silverPenny
        case "Silver Piece": return .silverPiece
        case "Gold Penny": return .goldPenny
        case "Gold Piece": return .goldPiece
        default:
            return .silverPenny
        }
    }
}
