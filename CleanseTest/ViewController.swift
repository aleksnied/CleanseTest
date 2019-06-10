//
//  ViewController.swift
//  CleanseTest
//
//  Created by Aleksander Niedziolko on 31/05/2019.
//  Copyright © 2019 Aleksander Niedziolko. All rights reserved.
//

import UIKit
import Cleanse

class ViewController: UIViewController {
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func injectProperties(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    struct Module : Cleanse.Module {
        static func configure(binder: UnscopedBinder) {
            binder.include(module: ViewModel.Module.self)
            
            binder
                .bind(ViewController.self)
                .to(value: Storyboard.Main.RootViewController.instantiate())
            
            binder
                .bind()
                .tagged(with: UIViewController.Root.self)
                .to { $0 as ViewController }
            
            binder
                .bindPropertyInjectionOf(ViewController.self)
                .to(injector: ViewController.injectProperties)
        }
    }
}

