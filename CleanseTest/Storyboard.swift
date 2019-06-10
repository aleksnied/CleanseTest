//
//  Storyboard.swift
//  CleanseTest
//
//  Created by Aleksander Niedziolko on 05/06/2019.
//  Copyright © 2019 Aleksander Niedziolko. All rights reserved.
//

import UIKit

struct Storyboard {
    
    enum Main: String {
        case RootViewController
        
        static let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        func instantiate<T: UIViewController>() -> T {
            return Storyboard.instantiate(Main.storyboard, identifier: self.rawValue)
        }
    }
    
    private static func instantiate<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Could not cast view controller to \(T.self)!")
        }
        return viewController
    }
}
