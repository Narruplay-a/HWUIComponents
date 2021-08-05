//
//  TabBarModel.swift
//  Osago
//
//  Created by Adel Khaziakhmetov on 02.07.2021.
//

import SwiftUI
import Combine

public final class CustomTabBarModel: ObservableObject {
    public var viewToPresentSubject : PassthroughSubject    = PassthroughSubject<AnyView?, Never>()
    public var viewToPresent        : AnyView?
    
    @Published
    public var selectedIndex        : Int
    @Published
    public var isTabBarVisible      : Bool                  = true
    @Published
    public var screens: [TabScreen]
    public var currentScreen: AnyView {
        guard screens.count > selectedIndex else { return screens.first?.item ?? AnyView(EmptyView()) }
        
        return screens[selectedIndex].item
    }
    
    public init(screens: [TabScreen], selectedIndex: Int = 0) {
        self.screens        = screens
        self.selectedIndex  = selectedIndex
        
        if screens.count == 1  {
            isTabBarVisible = false
        }
    }
    
    public func updateScreens(screens: [TabScreen], selectedIndex: Int = 0, isTabBarVisible: Bool) {
        self.screens            = screens
        self.selectedIndex      = selectedIndex
        self.isTabBarVisible    = isTabBarVisible
    }
    
    public func selectTab(for index: Int) {
        self.selectedIndex = index
    }
    
    public func present(view: AnyView) {
        viewToPresent = view
        viewToPresentSubject.send(view)
    }
    
    public func dismissPresentedView() {
        viewToPresent = nil
        viewToPresentSubject.send(nil)
    }
}

public final class TabScreen {
    public var tabItem: AnyView?
    public var item: AnyView
    
    public init(item: AnyView, tabItem: AnyView? = nil) {
        self.item = item
        self.tabItem = tabItem
    }
}
