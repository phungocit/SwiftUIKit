//
//  UINavigationController+.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI
import UIKit

extension UINavigationController: ObservableObject {
    public func pushView<RootView: View>(
        _ rootView: RootView,
        animated: Bool = true
    ) {
        pushViewController(PushViewController(rootView: rootView), animated: animated)
    }

    /// Pops the top view controller from the navigation stack.
    /// - Parameter animated: A boolean indicating whether the transition should be animated. Defaults to `true`.
    public func popView(animated: Bool = true) {
        popViewController(animated: animated)
    }

    /// Pops all the view controllers on the navigation stack, returning to the root view controller.
    /// - Parameter animated: A boolean indicating whether the transition should be animated. Defaults to `true`.
    public func popToRootView(animated: Bool = true) {
        popToRootViewController(animated: animated)
    }

    /// Sets the root view controller of the application.
    /// - Parameters:
    ///   - rootView: The new root view conforms to PushViewConfigurable.
    ///   - animated: A boolean indicating whether the transition to the new root view should be animated. Default is `false`.
    public func setRootView<RootView: PushViewConfigurable>(
        _ rootView: RootView,
        animated: Bool = false
    ) {
        setViewControllers([PushViewController(rootView: rootView)], animated: animated)
    }
}
