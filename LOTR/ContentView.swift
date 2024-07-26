//
//  ContentView.swift
//  LOTR
//
//  Created by Filip Simandl on 24.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo: Bool = false
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    var body: some View {
        ZStack {
            // background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                
            VStack {
                // logo
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200) // thanks to scaled to fit it looks normal...
                
                // some txt
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // conversion section
                HStack {
                    // left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // currency image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // currency text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        // text field
                        TextField("amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading)
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
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // currency image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        
                        // text field
                        TextField("amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing)
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
                        if showExchangeInfo == true {
                            
                        }
//                        print("showExchangeValue: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                }
                
            }
//            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
