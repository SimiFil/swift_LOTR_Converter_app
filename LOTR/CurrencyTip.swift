//
//  CurrencyTip.swift
//  LOTR
//
//  Created by Filip Simandl on 02.08.2024.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    // Text? - "optional text"
    var message: Text? {
        Text("You can tap the left or right currency to bring up the Select Currency screen.")
    }
}
