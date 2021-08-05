//
//  StockListItem.swift
//  HomeWork2
//
//  Created by Adel Khaziakhmetov on 15.07.2021.
//

import SwiftUI
import Combine

public struct StockListItem: View {
    public var publisher        : PassthroughSubject<String, Never> = PassthroughSubject()
    
    @State
    var reloadCell              : Bool                              = false
    @Binding
    public var hideFavoriteIcon : Bool

    public let symbol           : String
    public let name             : String
    
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
                        self.publisher.send(symbol)
                    }
            }
        }
    }
}