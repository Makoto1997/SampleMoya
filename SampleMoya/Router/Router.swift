//
//  Router.swift
//  SampleMoya
//
//  Created by Makoto on 2022/05/01.
//

import UIKit

final class Router {
    
    static let shared = Router()
    private init() {}
    private var window: UIWindow?
    
    func showRoot(window: UIWindow) {
        
        guard let vc = UIStoryboard.init(name: "List", bundle: nil).instantiateInitialViewController() else { return }
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
    
    private func show(from: UIViewController, to: UIViewController, completion:(() -> Void)? = nil){
        
        if let nav = from.navigationController {
            nav.pushViewController(to, animated: true)
            completion?()
        } else {
            from.present(to, animated: true, completion: completion)
        }
    }
}
