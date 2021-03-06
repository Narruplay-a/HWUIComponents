//
//  ErrorModal.swift
//  HomeWork2
//
//  Created by Adel Khaziakhmetov on 22.07.2021.
//

import SwiftUI

public struct ErrorModal: View {
    public var shouldShowModal: Binding<Bool>
    
    public init(shouldShowModal: Binding<Bool>) {
        self.shouldShowModal = shouldShowModal
    }
    
    public var body: some View {
        VStack {
            Text("Данные для компании не найдены.")
                .font(.system(size: 28).bold())
                .foregroundColor(.red)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.gray.opacity(0.98))
        .onTapGesture {
            shouldShowModal.wrappedValue = false
        }
    }
}
