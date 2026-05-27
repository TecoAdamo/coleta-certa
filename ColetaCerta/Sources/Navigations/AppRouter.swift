//
//  AppRouter.swift
//  ColetaCerta
//
//  Created by Mateus on 23/05/26.
//

import UIKit

final class AppRouter {

    static func setRootViewController(_ viewController: UIViewController) {

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
            return
        }

        sceneDelegate.window?.rootViewController = viewController
        sceneDelegate.window?.makeKeyAndVisible()
    }
}
