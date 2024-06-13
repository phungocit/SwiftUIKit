//
//  View+.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
