//
//  MyBaseViewController.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 26/03/21.
//

import UIKit

class MyBaseViewController: UIViewController {
    
    let mainView = BaseMainView()
    let viewModel = BaseViewModel()
    var presenter: Presenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setFrom(controller: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        modelRequest()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    func startMainView() {
        self.view.addSubview(mainView)
        mainView.attachAll(in: self.view)
        mainView.start()
    }
    
    func showErrorContext() {
        let title = "We got a problem..."
        if let errController = self.presenter?.errorController(action: .push,
                                                               completion: nil)
        as? ErrorViewController {
            errController.setErrorTexts(title: title, message: viewModel.errorText)
        }
        
    }
    
    func modelRequest(tag: String = StringConstants.initialTagKittens) {
        self.viewModel.tagText = tag
        viewModel.request(page: viewModel.page, searchTag: tag) { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.sync {
                switch self.viewModel.contentState {
                case .loaded:
                    self.startMainView()
                case .error, .failure:
                    self.showErrorContext()
                case .none:
                    break
                }
            }
        }
        
    }

}

extension MyBaseViewController: SearchTagDelegate {
    
    func searchRequest(tag: String) {
        viewModel.cleanPhotos()
        self.modelRequest(tag: tag)
    }
    
}
