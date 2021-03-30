//
//  UIImageView+Extension.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import UIKit

extension UIImageView {
    
    func getImageFrom(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
