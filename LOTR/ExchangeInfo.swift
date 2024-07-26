//
//  ExchangeInfo.swift
//  LOTR
//
//  Created by Filip Simandl on 25.07.2024.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // bg
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // title text
                Text("Exchange rates")
                    .font(.largeTitle)
                    .tracking(3) // spacing between letters
                
                // description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                // exchange rates
                ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, exchangeRateText: "1 gold piece = 4 gold pennies")
                ExchangeRate(leftImage: .goldpenny, rightImage: .silverpiece, exchangeRateText: "1 gold penny = 4 silver pennies")
                ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, exchangeRateText: "1 silver piece = 4 silver pennies")
                ExchangeRate(leftImage: .silverpenny, rightImage: .copperpenny, exchangeRateText: "1 silver penny = 100 copper pennies")
                
                // done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.title2)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
