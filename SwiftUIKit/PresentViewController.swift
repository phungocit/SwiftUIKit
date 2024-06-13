//
//  PresentViewController.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI
import UIKit

open class PresentViewController<
    RootView: PresentViewConfigurable
>: RoutingNavigationController {
    public init(rootView: RootView) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [
            PushViewController(rootView: rootView),
        ]
        overrideUserInterfaceStyle = rootView.userInterfaceStyle
        modalPresentationStyle = rootView.style
        modalTransitionStyle = rootView.transition
        isModalInPresentation = !rootView.isEnableInteractiveDismissal
        if let sheet = sheetPresentationController {
            sheet.detents = rootView.detents
            sheet.prefersGrabberVisible = rootView.prefersGrabberVisible
        }
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
