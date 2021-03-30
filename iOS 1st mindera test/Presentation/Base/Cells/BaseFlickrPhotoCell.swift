//
//  BaseFlickrPhotoCell.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import UIKit

class BaseFlickrPhotoCell: UICollectionViewCell {
    
    typealias  VFP = VisualFormatPatterns
    
    static var identifier: String {
        
        return String(describing: self)
    }
    
    var point =  CGPoint()
    
    let imageView: UIImageView = {
        
        let img = UIImageView()
        img.backgroundColor = .clear
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        
        return img
    }()
    
    let titleLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.font = UIFont.getHelveticaNeue(for: .draft)
        lbl.textColor = UIColor.darkText
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 12.5
        lbl.layer.masksToBounds = true
        
        return lbl
    }()
    
    let masterViewController: MyBaseViewController = {
        
        let homeVC = MyBaseViewController(nibName: nil, bundle: nil)
        
        return homeVC
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.point = CGPoint(x: self.frame.midX, y: masterViewController.view.frame.midY)
        configureLayout()
        setDefaultAccessibility()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.point = CGPoint(x: self.frame.midX, y: masterViewController.view.frame.midY)
        configureLayout()
        setDefaultAccessibility()
    }
        
    private func configureLayout() {
        
        let sizeHandler = SizeHandler(view: self)
        let spacing = sizeHandler.percentOfFrame(percent: 7.5, dimension: .height)
        let imageSides = sizeHandler.percentOfFrame(percent: 85, dimension: .width)
       
        setAppearance()
        addSubview(imageView)
        addSubview(titleLabel)
        
        titleLabel.font = UIFont.getVerdana(for: .text)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        
        contentView.setUpContraints(pattern: VFP.fullHorSmall,
                                    options: nil, views: titleLabel)
        contentView.setUpContraints(pattern: "H:[v0(\(imageSides))]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, views: imageView)
        contentView.setUpContraints(pattern: "V:|-(<=\(spacing))-[v0(\(imageSides))]-[v1(28)]-|",options:NSLayoutConstraint.FormatOptions.alignAllCenterX, views: imageView,titleLabel)
        
    }
    
    func setDefaultAccessibility() {
        self.titleLabel.isAccessibilityElement = false
        self.isAccessibilityElement = true
        self.accessibilityTraits = .button
        self.accessibilityLabel = self.titleLabel.text
        
    }
    
    func setAppearance(){
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 15.0
        contentView.contentMode = .scaleAspectFit
        contentView.layer.shadowColor = UIColor.darkGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 1.5, height: 1.0)
        contentView.layer.shadowOpacity = 0.65
        contentView.layer.shadowRadius = 5
        
    }
    
    func setupData(urlString: String, title: String) {
        imageView.image = UIImage(named: StringConstants.kPlaceHoderName)
        imageView.getImageFrom(urlString: urlString)
        self.titleLabel.text = title

    }
}
