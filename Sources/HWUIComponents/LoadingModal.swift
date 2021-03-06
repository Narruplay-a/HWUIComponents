//
//  LoadingModal.swift
//  HomeWork2
//
//  Created by Adel Khaziakhmetov on 15.07.2021.
//

import SwiftUI

public struct LoadingModal: View {
    public init() {}
    
    public var body: some View {
        VStack {
            ProgressView()
                .padding(.bottom, 15)
            Text("Подождите...")
                .font(.system(size: 28).bold())
                .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.gray.opacity(0.98))
    }
}
