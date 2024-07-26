//
//  ExchangeRate.swift
//  LOTR
//
//  Created by Filip Simandl on 26.07.2024.
//

import SwiftUI

struct ExchangeRate: View {
    let imageHeight: CGFloat = 33
    let leftImage: ImageResource
    let rightImage: ImageResource
    let exchangeRateText: String
    
    var body: some View {
        HStack {
            // left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: imageHeight)
            
            // exchange rate text
            Text(exchangeRateText)
            
            // right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: imageHeight)
        }
        .padding()
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, exchangeRateText: "1 gold piece = 4 gold pennies")
}
