//
//  ImageViewController.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 30/03/21.
//

import UIKit

class ImageViewController: UIViewController {
        
    private let mainView = ImageMainView()
    let sizeHandler = SizeHandler.current
    var presenter: Presenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startMainView()
    }
    
    func startMainView() {
        self.view.addSubview(mainView)
        let height = sizeHandler.height / 1.75
        let width = sizeHandler.width / 1.15
        
        mainView.centerVertically(in: self.view, height: height)
        mainView.centerHorizontally(in: self.view, width: width)
        mainView.start()
    }
    
    func setImage(fromURL: String) {
        self.mainView.setupImage(from: fromURL)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let touch = touches.first,
           self.view.frame.contains(touch.preciseLocation(in: self.view)) {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
