//
//  BaseHeaderView.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import UIKit

protocol SearchTagDelegate: class {
    func searchRequest(tag: String)
}

class BaseHeaderView: UIView {
    
    let titleLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.font = UIFont.getVerdana(for: .title)
        lbl.textColor = UIColor.darkText
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    let button: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setBackgroundImage(UIImage(named: StringConstants.kSeachBtn),
                               for: .normal)
        btn.setBackgroundImage(UIImage(named: StringConstants.kSeachBtn)?.imageWithoutBaseline(),
                               for: .highlighted)
        btn.showsTouchWhenHighlighted = true
        
        return btn
    }()
    
    lazy var seachField: UISearchTextField = {
        let stf = UISearchTextField()
        stf.returnKeyType = .search
        stf.delegate = self
        stf.clearsOnInsertion = true
        stf.backgroundColor = .lightText
        stf.textColor = .darkGray
        stf.insertLine(width: 1, color: .black)
        stf.text = StringConstants.initialTagKittens
        
        return stf
    }()
    
    weak var searchDelegate: SearchTagDelegate?

    func start() {
        configureLayout()
        setButtonTarget()
    }
    
    func configureLayout() {
        addSubview(titleLabel)
        addSubview(seachField)
        addSubview(button)
        
        titleLabel.text = StringConstants.appTitleText
        setUpContraints(pattern: "V:|-4-[v0(24)]", options: nil,
                        views: titleLabel)
        setUpContraints(pattern: "V:|-2-[v0(32)]", options: nil,
                        views: button)
        setUpContraints(pattern: "V:|-38-[v0]|", options: nil,
                        views: seachField)
        setUpContraints(pattern: "H:|-[v0(<=190)]-16-[v1(32)]-16-|",
                        options: nil,
                        views: titleLabel, button)
        setUpContraints(pattern: "H:|-[v0]-|", options: .alignAllLastBaseline,
                        views: seachField)
    }
    
    private func setButtonTarget() {
        button.addTarget(self, action: #selector(searchAction),
                         for: .touchUpInside)
    }
    
    @objc
    private func searchAction() {
        guard let tag = self.seachField.text else { return }
        self.searchDelegate?.searchRequest(tag: tag)

    }
}

extension BaseHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let tag = textField.text else { return false }
        self.searchDelegate?.searchRequest(tag: tag)
        
        return true
    }
    
}
