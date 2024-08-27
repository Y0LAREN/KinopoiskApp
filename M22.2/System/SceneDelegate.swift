//
//  SceneDelegate.swift
//  M22.2
//
//  Created by Илья Иванов on 03.08.2024.
//

import UIKit
import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = UINavigationController(rootViewController: TapBarController())
    window?.makeKeyAndVisible()
    
    guard let _ = (scene as? UIWindowScene) else { return }
  }
  
}

