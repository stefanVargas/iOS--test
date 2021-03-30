//
//  UIView+Extension.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import UIKit

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func insertLine(width: CGFloat, color: UIColor) {
        let lineView = UIView()
        self.addSubview(lineView)
        self.setUpContraints(pattern: "H:|[v0]|", options: nil, views: lineView)
        self.setUpContraints(pattern: "V:[v0(\(width))]|", options: nil,
                             views: lineView)

    }
    
    func insertDashedBorder(width: CGFloat, color: UIColor) {
        let viewBorderLayer = CAShapeLayer()
        viewBorderLayer.strokeColor = color.cgColor
        viewBorderLayer.lineDashPattern = [4, 2]
        viewBorderLayer.frame = self.frame
        viewBorderLayer.lineWidth = width
        viewBorderLayer.fillColor =  color.cgColor
        viewBorderLayer.backgroundColor =  color.cgColor
        viewBorderLayer.borderColor =  color.cgColor
        viewBorderLayer.lineJoin = CAShapeLayerLineJoin.round

        
        viewBorderLayer.path = UIBezierPath(rect: self.frame).cgPath
        
        self.layer.addSublayer(viewBorderLayer)
    }
    
    //Layout

    func setUpContraints(pattern: String, options: NSLayoutConstraint.FormatOptions?,
                         views: UIView...) {
        var myViews: [String : UIView] = [:]
        
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            myViews["v\(index)"] = view
            
        }
        
        var customOptions = NSLayoutConstraint.FormatOptions()
        if options != nil {
            customOptions = options ?? NSLayoutConstraint.FormatOptions()
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: pattern, options: customOptions, metrics: nil, views: myViews))
    }
    
    func attachAll(in superview: UIView) {
        centerViewLayout(in: superview)
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0)
            .isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0)
            .isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0)
            .isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0)
            .isActive = true
        
    }
    
    func centerViewLayout(in superview: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    func centerHorizontally(in superview: UIView, width: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            .isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func centerVertically(in superview: UIView, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            .isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func resizeViewLayout(in superview: UIView, size: CGSize) {
        self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
}
