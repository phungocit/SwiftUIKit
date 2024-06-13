//
//  PresentViewConfigurable.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import UIKit

public protocol PresentViewConfigurable: PushViewConfigurable {
    // The presentation style to be used. Default is `.pageSheet`.
    var style: UIModalPresentationStyle { get }

    // The transition style to be used. Default is `.coverVertical`.
    var transition: UIModalTransitionStyle { get }

    //  A boolean indicating whether interactive dismissal is enabled. Default is `true`.
    var isEnableInteractiveDismissal: Bool { get }

    // Constants that indicate the interface style for the app. Value are `unspecified`, `light` and `dark`.
    var userInterfaceStyle: UIUserInterfaceStyle { get }

    // See more present view configuration at:
    // https://sarunw.com/posts/bottom-sheet-in-ios-15-with-uisheetpresentationcontroller/

    // The array of detents that the sheet may rest at.
    // This array must have at least one element.
    // Detents must be specified in order from smallest to largest height.
    // Default: an array of only [UISheetPresentationControllerDetent largeDetent].
    var detents: [UISheetPresentationController.Detent] { get }

    // Set to true to show a grabber at the top of the sheet. Default is `false`.
    var prefersGrabberVisible: Bool { get }
}

public extension PresentViewConfigurable {
    var style: UIModalPresentationStyle {
        .pageSheet
    }

    var transition: UIModalTransitionStyle {
        .coverVertical
    }

    var isEnableInteractiveDismissal: Bool {
        true
    }

    var userInterfaceStyle: UIUserInterfaceStyle {
        .unspecified
    }

    var detents: [UISheetPresentationController.Detent] {
        [.large()]
    }

    var prefersGrabberVisible: Bool {
        false
    }
}

public extension UISheetPresentationController.Detent {
    @available(iOS 16.0, *)
    static func customLargeDetent(
        identifier: UISheetPresentationController.Detent.Identifier? = nil,
        detentReduce: CGFloat = 0.2
    ) -> UISheetPresentationController.Detent {
        .custom(identifier: identifier) { context in
            context.maximumDetentValue - detentReduce
        }
    }

    @available(iOS 16.0, *)
    static func customDetentWidth(
        identifier: UISheetPresentationController.Detent.Identifier? = nil,
        _ width: CGFloat
    ) -> UISheetPresentationController.Detent {
        .custom(identifier: identifier) { _ in
            width
        }
    }
}
