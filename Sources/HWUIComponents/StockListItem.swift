//
//  StockListItem.swift
//  HomeWork2
//
//  Created by Adel Khaziakhmetov on 15.07.2021.
//

import SwiftUI
import Combine

public struct StockListItem: View {
    @State
    var reloadCell              : Bool                              = false
    
    public var hideFavoriteIcon : Bool

    public let symbol           : String
    public let name             : String
    
    public let favoriteCallback : (String) -> Void
    
    public init(symbol: String, name: String, hideFavoriteIcon: Bool, favoriteCallback: @escaping (String) -> Void) {
        self.symbol             = symbol
        self.name               = name
        self.hideFavoriteIcon   = hideFavoriteIcon
        self.favoriteCallback   = favoriteCallback
    }
    
    public var body: some View {
        HStack() {
            if reloadCell { }
            VStack(alignment: .leading, spacing: 10) {
                Text("Тикер:")
                    .font(.system(.caption))
                    .foregroundColor(.gray)
                Text(symbol)
                    .font(.system(.headline))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Text("Название:")
                    .font(.system(.caption))
                    .foregroundColor(.gray)
                Text(name)
                    .font(.system(.headline))
            }
            
            if !hideFavoriteIcon {
                Image("star_icon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 15)
                    .onTapGesture {
                        self.reloadCell.toggle()
                        self.favoriteCallback(self.symbol)
                    }
            }
        }
    }
}
