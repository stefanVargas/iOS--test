//
//  ImageMainView.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 30/03/21.
//

import UIKit

class ImageMainView: UIView {
    
    typealias  VFP = VisualFormatPatterns

    let imageView: UIImageView = {
        
        let img = UIImageView()
        img.backgroundColor = .clear
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        
        return img
    }()
    
    func start() {
        configureLayout()
    }
    
    
    func configureLayout() {
        self.backgroundColor = .lightText
        self.layer.cornerRadius = 8.0
        addSubview(imageView)
        imageView.attachAll(in: self)
        
    }
    
    func setupImage(from urlString: String) {
        imageView.image = UIImage(named: StringConstants.kPlaceHoderName)
        imageView.getImageFrom(urlString: urlString)

    }

}
