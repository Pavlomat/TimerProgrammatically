//
//  SceneDelegate.swift
//  TimerProgrammatically
//
//  Created by Pavlov Matvey on 21.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .white
        let rootviewController = ViewController()
        window?.rootViewController = rootviewController
        window?.makeKeyAndVisible()
    }
}

