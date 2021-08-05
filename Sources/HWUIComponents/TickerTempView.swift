//
//  TickerTempIcon.swift
//  HomeWork2
//
//  Created by Adel Khaziakhmetov on 16.07.2021.
//

import SwiftUI

public struct TickerTempView: View {
    private let symbol: String
    
    public init(name: String) {
        symbol = String(name.first ?? "!")
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.secondary)
            
            Text(symbol)
                .foregroundColor(.white)
                .font(.system(size: 100).bold())
        }
    }
}
