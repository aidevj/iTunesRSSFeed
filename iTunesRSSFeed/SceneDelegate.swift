//
//  SceneDelegate.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/14/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let rssViewModel = RSSFeedViewModel()
        window?.rootViewController = RSSFeedViewController(viewModel: rssViewModel)
        window?.makeKeyAndVisible()
    }

}
