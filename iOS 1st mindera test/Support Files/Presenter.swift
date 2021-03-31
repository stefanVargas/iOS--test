//
//  Presenter.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 29/03/21.
//

import UIKit

@objc
enum PresenterAction: Int {
    case present
    case push
    case get
    
}

@objc
protocol PresenterDelegate: class {
    @objc
    optional func didPresentMain()
}

class Presenter: NSObject {
    let window: UIWindow
    var navigation = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        self.configureNavigation()
        self.window.rootViewController = self.navigation
        self.window.makeKeyAndVisible()

    }
    
    private func configureNavigation() {
        let controller = mainBaseController(action: .get)
        self.navigation = UINavigationController(rootViewController: controller)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        self.navigation.navigationBar.isTranslucent = true
        self.navigation.navigationBar.standardAppearance = appearance
        self.navigation.navigationBar.tintColor = .darkGray
        
    }
    
    @objc
    @discardableResult
    func mainBaseController(action: PresenterAction) -> UIViewController {
        
        for controller in self.navigation.viewControllers {
            if controller.isKind(of: MyBaseViewController.self),
               let baseController = controller as? MyBaseViewController {
                baseController.presenter = self
                return perform(action: action, for: baseController,
                               completion: nil)
            }
        }
        let baseController = MyBaseViewController()
        baseController.presenter = self

        return perform(action: action, for: baseController, completion: nil)
        
    }
    
    @objc
    @discardableResult
    func imageController(action: PresenterAction,
                         completion: (() -> Void)?) -> UIViewController {
        
        for controller in self.navigation.viewControllers {
            if controller.isKind(of: ImageViewController.self),
               let imgController = controller as? ImageViewController {
                imgController.presenter = self
                return perform(action: action, for: imgController,
                               completion: completion)
            }
        }
        let imgController = ImageViewController()
        imgController.presenter = self

        return perform(action: action, for: imgController, completion: completion)
        
    }
    
    @objc
    @discardableResult
    func errorController(action: PresenterAction,
                         completion: (() -> Void)?) -> UIViewController {
        
        for controller in self.navigation.viewControllers {
            if controller.isKind(of: ErrorViewController.self),
               let errorController = controller as? ErrorViewController {
                errorController.presenter = self
                return perform(action: action, for: errorController,
                               completion: completion)
            }
        }
        let errorController = ErrorViewController()
        errorController.presenter = self

        return perform(action: action, for: errorController,
                       completion: completion)
    }
            
    @objc
    @discardableResult
    func perform(action: PresenterAction,
                        for controller: UIViewController,
                        completion: (() -> Void)?) -> UIViewController {
        
        switch action {
        case .present:
            self.navigation.present(controller, animated: true,
                                    completion: completion)
            return controller
            
        case .push:
            self.navigation.pushViewController(controller, animated: true)
            return controller
            
        case .get:
            return controller
            
        }
    }
    
}
