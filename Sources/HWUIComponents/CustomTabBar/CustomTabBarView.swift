//
//  TabBarScreen.swift
//  Osago
//
//  Created by Adel Khaziakhmetov on 02.07.2021.
//

import SwiftUI

public struct CustomTabBarView: View {
    @ObservedObject
    public var model    : CustomTabBarModel
    @State
    public var showView : Bool              = false

    public init(model: CustomTabBarModel) {
        self.model = model
    }
    
    public var body: some View {
        ZStack {
            if !model.isTabBarVisible {
                model.currentScreen
            } else {
                TabView(selection: $model.selectedIndex) {
                    ForEach(model.screens.indices) { ind in
                        model.screens[ind].item
                            .tag(ind)
                            .tabItem {
                                model.screens[ind].tabItem
                            }
                    }
                }
            }

            if showView, let view = model.viewToPresent {
                view
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.all)
        .onReceive(model.viewToPresentSubject) { view in
            model.viewToPresent = view
            showView = view != nil
        }
    }
}
