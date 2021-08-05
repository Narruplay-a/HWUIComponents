//
//  CalculationNavigationView.swift
//  Osago
//
//  Created by Adel Khaziakhmetov on 01.07.2021.
//

import SwiftUI
import Combine

public struct CustomNavigationBarView: View {
    @ObservedObject var model: CustomNavigationBarModel
    
    public var body: some View {
        ZStack(alignment: .bottomLeading) {
            if model.shouldShowBackButton {
                Image("back_icon")
                    .frame(width: 28, height: 28)
                    .scaledToFill()
                    .padding(.leading, 10)
                    .padding(.bottom, 6)
                    .onTapGesture {
                        model.navigationSubject.send(true)
                    }
            }
            
            HStack {
                Spacer()
                Text(model.title)
                    .lineLimit(0)
                    .font(.system(size: 18).bold())
                    .fixedSize(horizontal: false, vertical: false)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            VStack {
                Spacer()
                Divider()
                    .frame(height: 1)
                    .background(Color.gray.opacity(0.05))
            }
        }
    }
}

public final class CustomNavigationBarModel: ObservableObject {
    @Published
    public var title                    : String    = ""
    @Published
    public var shouldShowBackButton     : Bool      = false
    
    public var navigationSubject: PassthroughSubject<Bool, Never>
    
    private var cancellables: Set<AnyCancellable> = Set()

    public init(navigationSubject: PassthroughSubject<Bool, Never>,
                title: Published<String>.Publisher,
                shouldShowBackButton: Published<Bool>.Publisher) {
        self.navigationSubject      = navigationSubject
        title
            .assign(to: \.title, on: self)
            .store(in: &cancellables)
        shouldShowBackButton
            .assign(to: \.shouldShowBackButton, on: self)
            .store(in: &cancellables)
    }
    
    deinit {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
}
