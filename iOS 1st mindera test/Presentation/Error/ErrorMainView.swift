//
//  ErrorMainView.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 28/03/21.
//

import UIKit

class ErrorMainView: UIView {
    
    typealias  VFP = VisualFormatPatterns

    let imageView: UIImageView = {
        
        let img = UIImageView()
        img.backgroundColor = .clear
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        
        return img
    }()

    let titleLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.font = UIFont.getVerdana(for: .title)
        lbl.textColor = UIColor.darkText
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    let messageLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.font = UIFont.getHelveticaNeue(for: .draft)
        lbl.textColor = UIColor.darkText
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    func start() {
        configureLayout()
    }
    
    
    func configureLayout() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(messageLabel)
        self.imageView.image = UIImage(named: StringConstants.kErrorImgName)
        
        setUpContraints(pattern: "V:|-72-[v0(256)]-28-[v1(28)]-32-[v2]",
                        options: .alignAllCenterX,
                        views: imageView, titleLabel, messageLabel)
        setUpContraints(pattern: VFP.ajustableInCenterHor(left: 16, right: 16),
                        options: .alignAllCenterY,
                        views: imageView)
        setUpContraints(pattern: VFP.ajustableInCenterHor(left: 32, right: 32),
                        options: .alignAllCenterY,
                        views: messageLabel)
        setUpContraints(pattern: VFP.mainView, options: .alignAllCenterY,
                        views: titleLabel)
    }
    
    func setTexts(title: String, message: String)  {
        self.titleLabel.text = title
        self.messageLabel.text = message
    }

}
