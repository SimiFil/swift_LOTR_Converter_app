//
//  ContentView.swift
//  LOTR
//
//  Created by Filip Simandl on 24.07.2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let defaults = UserDefaults.standard // creating new instance of userDefaults
    
    var body: some View {
        ZStack {
            // background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .onTapGesture {
                    leftTyping = false
                    rightTyping = false
                }
                
            VStack {
                // logo
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200) // thanks to scaled to fit it looks normal...
                
                // some txt
                Text("Currency Exchange ")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // conversion section
                HStack {
                    // left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        
                        // text field
                        TextField("amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            
                    }
                    
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    // right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        // text field
                        TextField("amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.buttonBorder).padding()
                
                Spacer() // makes a lot of space between two views
                
                // info button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
//                        print("showExchangeValue: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                }
            }
            
//            .border(.blue)
        }
        // does action before the view loads
        .task {
            try? Tips.configure() // try but optional, so it tries, but if not working - it gives up
        }
        .onAppear {
            // Load saved currencies
            let savedLeftCurrency = defaults.string(forKey: "leftCurrency")
            let savedRightCurrency = defaults.string(forKey: "rightCurrency")
            
            if (savedLeftCurrency != nil || savedRightCurrency != nil) {
                leftCurrency = Currency.from(identifier: savedLeftCurrency ?? "Silver Piece")
                rightCurrency = Currency.from(identifier: savedRightCurrency ?? "Gold Piece")
            }
        }
        .onChange(of: leftAmount) {
            if (leftTyping) {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if (rightTyping) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            defaults.set(leftCurrency.name, forKey: "leftCurrency")
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            defaults.set(rightCurrency.name, forKey: "rightCurrency")
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
