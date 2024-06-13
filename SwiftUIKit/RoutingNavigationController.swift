//
//  RoutingNavigationController.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import Combine
import Foundation
import SwiftUI
import UIKit

/// Navigation controller that should be used only in combination with the ``PushViewController``.
///
/// It overrides the ``setNavigationBarHidden(_:animated:)`` method in a way where it will always ask
/// the currently pushed view controller for its preference stored in the ``RoutingNavigationConfigurable.isTopBarHidden``
/// parameter, ignoring any actual parameters passed to it.
///
/// This is done in such a way because at some point during the layout process SwiftUI also
/// tries to change the current navigation bar visibility even though it shouldn't.
open class RoutingNavigationController: UINavigationController {
    override open func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        guard let hostingChild = children.last as? RoutingNavigationConfigurable else {
            return super.setNavigationBarHidden(hidden, animated: animated)
        }

        super.setNavigationBarHidden(hostingChild.isTopBarHidden, animated: animated)
    }
}
