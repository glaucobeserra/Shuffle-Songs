//
//  UIViewController+Extension.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 07/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String, message: String, action: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
