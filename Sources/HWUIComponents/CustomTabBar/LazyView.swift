//
//  LazyView.swift
//  HomeWork2
//
//  Created by Adel Khaziakhmetov on 12.07.2021.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    public init(_ build: @escaping () -> Content) {
        self.build = build
    }

    public var body: Content {
        build()
    }
}
