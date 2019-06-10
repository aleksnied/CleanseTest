//
//  Coordinator.swift
//  CleanseTest
//
//  Created by Aleksander Niedziolko on 31/05/2019.
//  Copyright © 2019 Aleksander Niedziolko. All rights reserved.
//

import UIKit
import Cleanse

class Coordinator {
    
    private var window: UIWindow!
    private var rootViewControllerProvider: TaggedProvider<UIViewController.Root>!
    
    init(_ window: UIWindow, _ rootViewControllerProvider: TaggedProvider<UIViewController.Root>) {
        self.window = window
        self.rootViewControllerProvider = rootViewControllerProvider
    }
    
    func navigateToRoot() {
        let navController = UINavigationController()
        navController.pushViewController(rootViewControllerProvider.get(), animated: false)
        window.rootViewController = navController
        self.window.makeKeyAndVisible()
    }
}

extension Coordinator {
    struct Module : Cleanse.Module {
        typealias Scope = Singleton
        
        static func configure(binder: Binder<Singleton>) {
            binder.include(module: UIWindow.Module.self)
            binder.include(module: ViewController.Module.self)
            
            binder
                .bind(Coordinator.self)
                .sharedInScope()
                .to(factory: Coordinator.init)
        }
    }
}


extension UIWindow {
    struct Module : Cleanse.Module {
        typealias Scope = Singleton
        
        static func configure(binder: Binder<Singleton>) {
            binder
                .bind(UIWindow.self)
                .sharedInScope()
                .to(value: UIWindow(frame: UIScreen.main.bounds))
        }
    }
}

extension UIViewController {
    public struct Root : Tag {
        public typealias Element = UIViewController
    }
}
