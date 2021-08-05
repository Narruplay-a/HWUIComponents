//
//  IPOItem.swift
//  HomeWork2
//
//  Created by Adel Khaziakhmetov on 19.07.2021.
//

import SwiftUI

public struct IPOItem: View {
    public let symbol  : String
    public let date    : String
    
    public var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 10) {
                Text("Тикер:")
                    .font(.system(.caption))
                    .foregroundColor(.gray)
                Text(symbol)
                    .font(.system(.headline))
            }
            Spacer()

            VStack(alignment: .leading, spacing: 10) {
                Text("Дата:")
                    .font(.system(.caption))
                    .foregroundColor(.gray)
                Text(date)
                    .font(.system(.headline))
            }
        }
    }
}
