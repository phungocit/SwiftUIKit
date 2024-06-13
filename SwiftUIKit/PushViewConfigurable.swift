//
//  PushViewConfigurable.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI

public protocol PushViewConfigurable: View {
    var title: String { get }
    var isTopBarHidden: Bool { get }
    var topBarLeadingView: any View { get }
    var topBarTrailingView: any View { get }
}

public extension PushViewConfigurable {
    var isTopBarHidden: Bool {
        false
    }

    var topBarLeadingView: any View {
        EmptyView()
    }

    var topBarTrailingView: any View {
        EmptyView()
    }
}
