//
//  AppDelegate.swift
//  CleanseTest
//
//  Created by Aleksander Niedziolko on 31/05/2019.
//  Copyright © 2019 Aleksander Niedziolko. All rights reserved.
//

import UIKit
import Cleanse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var mainCoordinator: Coordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let propertyInjector = try! ComponentFactory.of(AppDelegate.Component.self).build(())
        
        propertyInjector.injectProperties(into: self)
        
        mainCoordinator.navigateToRoot()
        
        return true
    }
}

extension AppDelegate {
    struct Component : Cleanse.RootComponent {

        typealias Root = PropertyInjector<AppDelegate>
        typealias Scope = Singleton
        
        static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
            return bind.propertyInjector(configuredWith: { bind in
                bind.to(injector: AppDelegate.injectProperties)
            })
        }
        
        static func configure(binder: Binder<Singleton>) {
            binder.include(module: Coordinator.Module.self)
        }
    }
    
    func injectProperties(_ navigator: Coordinator) {
        self.mainCoordinator = navigator
    }
}

