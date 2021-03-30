//
//  ErrorViewController.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 28/03/21.
//

import UIKit

class ErrorViewController: UIViewController {
    
    let mainView = ErrorMainView()
    var presenter: Presenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        startMainView()
        self.navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    func startMainView() {
        self.view.addSubview(mainView)
        mainView.attachAll(in: self.view)
        mainView.start()
    }

    
    func setErrorTexts(title: String, message: String) {
        self.mainView.setTexts(title: title, message: message)
    }

}
