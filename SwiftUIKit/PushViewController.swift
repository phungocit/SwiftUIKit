//
//  PushViewController.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI
import UIKit

open class PushViewController<RootView: View>: UIViewController {
    let rootView: RootView

    public init(rootView: RootView) {
        self.rootView = rootView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        addRootView()
    }
}

private extension PushViewController {
    func addRootView() {
        let hostingController = UIHostingController(rootView: rootView)

        view.addSubview(hostingController.view)
        addChild(hostingController)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        hostingController.didMove(toParent: self)
    }
}
