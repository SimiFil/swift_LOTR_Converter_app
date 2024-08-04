//
//  SelectCurrency.swift
//  LOTR
//
//  Created by Filip Simandl on 26.07.2024.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            // parchment bg image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // text
                Text("Select currency you are starting with: ")
                    .fontWeight(.bold)
                    .padding(2)
                
                // currency icons
                IconGrid(selectedCurrency: $topCurrency)
                
                // text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                // currency icons
                IconGrid(selectedCurrency: $bottomCurrency)
                
                // done button
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
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
