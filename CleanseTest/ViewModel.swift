//
//  ViewModel.swift
//  CleanseTest
//
//  Created by Aleksander Niedziolko on 06/06/2019.
//  Copyright © 2019 Aleksander Niedziolko. All rights reserved.
//

import Foundation
import Cleanse

struct ViewModel {
    
    //var repo: Repo!
    
    init() {
        
    }
    
    struct Module : Cleanse.Module {
        static func configure(binder: Binder<Unscoped>) {
            binder
                .bind(ViewModel.self)
                .to(factory: ViewModel.init)
        }
    }
}
