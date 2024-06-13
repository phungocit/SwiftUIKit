//
//  SwiftUIKitApp.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            window = UIWindow(frame: firstScene.screen.bounds)
            let navigationController = UINavigationController()
            let viewControllers = [
                PushViewController(
                    rootView: ContentView1(title: "First")
                        .environmentObject(navigationController)
                )
            ]

            navigationController.viewControllers = viewControllers
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
        return true
    }
}

// @main
// struct SwiftUIKitApp: App {
//   var body: some Scene {
//       WindowGroup {
//           RootNavigationController(rootView: ContentView1(title: "1"))
//       }
//   }
// }

// var navigationControllers: [UINavigationController] = []
//
// struct TabController: UIViewControllerRepresentable {
//    typealias UIViewControllerType = UITabBarController
//
//    var content: [AnyView]
//
//    init(content: () -> [AnyView]) {
//        self.content = content()
//    }
//
//    func makeUIViewController(context: Context) -> UITabBarController {
//        let tab = UITabBarController()
//        let vcs = content.map { v -> UIViewController in
//            let h = UIHostingController(rootView: v)
//            let n = UINavigationController(rootViewController: h)
//            navigationControllers.append(n)
//            n.tabBarItem = UITabBarItem(title: "A", image: UIImage(systemName: "book.circle"), selectedImage: nil)
//            return n
//        }
//        tab.viewControllers = vcs
//        return tab
//    }
//
//    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {}
// }
