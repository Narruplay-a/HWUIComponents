//
//  CustomNavigationModel.swift
//  Osago
//
//  Created by Adel Khaziakhmetov on 02.07.2021.
//

import SwiftUI
import Combine

public final class CustomNavigationViewModel: ObservableObject {
    @Published
    public var currentScreen: Screen?
    @Published
    public var shouldShowNavigationBar  : Bool      = true
    @Published
    public var shouldShowbackButton     : Bool      = false
    @Published
    public var title                    : String    = ""
    
    public let navigationSubject: PassthroughSubject<Bool, Never> = PassthroughSubject()
    public lazy var navigationBarModel = CustomNavigationBarModel(navigationSubject: navigationSubject,
                                                           title: $title,
                                                           shouldShowBackButton: $shouldShowbackButton)
    
    private var screenStack: ScreenStack {
        didSet {
            currentScreen = screenStack.top()
        }
    }

    public var navigationType: NavType = .push
    public var id: Int = 0
 
    private(set) var navigationIndex: Int = 0
    private let easing: Animation = Animation.easeInOut(duration: 0.3)
    
    public init(screenStack: ScreenStack, id: Int) {
        self.id = id
        self.screenStack = screenStack
        self.currentScreen = screenStack.top()
        navigationIndex = screenStack.screenCount - 1
    }
    
    public func push<S: View>(_ screenView: S) {
        shouldShowbackButton = true
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(screen: AnyView(screenView))
            screenStack.push(screen)
            navigationIndex += 1
        }
    }
    
    public func pop(toRoot: Bool) {
        shouldShowbackButton = !(navigationIndex == 1 || toRoot)
        withAnimation(easing) {
            navigationType = .pop
            switch toRoot {
            case true:
                screenStack.popToRoot()
                navigationIndex = 0
            case false:
                guard navigationIndex > 0 else { return }
                
                screenStack.popToPrevious()
                navigationIndex -= 1
            }
        }
    }
}

public struct ScreenStack {
    private var screens: [Screen]
    public  var screenCount: Int { return screens.count }
    
    public init(screens: [Screen]) {
        self.screens = screens
    }
    
    public func top() -> Screen? {
        screens.last
    }
    
    public mutating func push(_ s: Screen) {
        screens.append(s)
    }
    
    public mutating func popToPrevious() {
        _ = screens.popLast()
    }
    
    public mutating func popToRoot() {
        screens.removeAll()
    }
}

public struct Screen: Identifiable, Equatable {
    public let id: String = UUID().uuidString
    public let screen: AnyView
    
    public static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

public enum NavType {
    case push
    case pop
}
