//
//  SceneDelegate.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit
@_exported import LikeServer

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        Task {
            let factory = DataManageableObjectFactory<DataManager>()
            let dataManager = factory.getInstance()
            
            let result = try await dataManager.fetch(with: .users, .userWithID(id: "7"))
            
            guard case let GetResult.user(user) = result else { return }
            
            let home: HomeViewController = HomeViewController(user: user)
            let explore: ExploreViewController = ExploreViewController()
            let profile: ProfileViewController = ProfileViewController()
            let tabBar: UITabBarController = UITabBarController()
            
            home.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), tag: 0)
            explore.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "magnifyingglass"), tag: 1)
            profile.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.fill"), tag: 2)
            tabBar.viewControllers = [home, explore, profile]
            
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = tabBar
            window?.backgroundColor = .systemBackground
            window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

