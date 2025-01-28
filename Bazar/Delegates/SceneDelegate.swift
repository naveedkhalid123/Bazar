//
//  SceneDelegate.swift
//  Bazar
//
//  Created by Naveed Khalid on 22/01/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ensure the scene is of type UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = AuthorViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // This method is called when the scene is being released by the system.
        // Release any resources associated with this scene.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Restart any tasks that were paused or not started when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Pause ongoing tasks or disable features when the app is transitioning to the background.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Undo changes made when the app entered the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Save data and release shared resources when the app enters the background.
    }
}
