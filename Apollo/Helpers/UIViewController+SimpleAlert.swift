//
//  UIViewController+SimpleAlert.swift
//  Apollo
//
//  Created by Enrique Gongora on 9/22/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentSimpleAlert(with title: String?,
                            message: String?,
                            preferredStyle: UIAlertController.Style,
                            dismissText: String,
                            completionUponDismissal: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let dismissAction = UIAlertAction(title: dismissText, style: .cancel, handler: completionUponDismissal)
        alert.addAction(dismissAction)
        
        present(alert, animated: true, completion: nil)
    }
}
