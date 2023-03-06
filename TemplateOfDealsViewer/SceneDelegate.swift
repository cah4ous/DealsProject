// SceneDelegate.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Scene Delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        let assemblyBuilder = AssemblyBuilder()
        let dealViewController = assemblyBuilder.makeDealModule()
        let navigationController = UINavigationController(rootViewController: dealViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
