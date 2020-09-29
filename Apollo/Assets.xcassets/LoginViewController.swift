//
//  LoginViewController.swift
//  Apollo
//
//  Created by Enrique Gongora on 9/24/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit
import OktaAuth
import SwiftUI

class LoginViewController: UIViewController {

    let profileController = ProfileController.shared
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationSuccessful, object: nil, queue: .main, using: checkForExistingProfile)
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationExpired, object: nil, queue: .main, using: alertUserOfExpiredCredentials)
        
    }
    
    // MARK: - IBActions
    @IBAction func signIn(_ sender: UIButton) {
        UIApplication.shared.open(ProfileController.shared.oktaAuth.identityAuthURL()!)
    }
    
    // MARK: - Private Methods
    private func alertUserOfExpiredCredentials(_ notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presentSimpleAlert(with: "Your Okta credentials have expired",
                           message: "Please sign in again",
                           preferredStyle: .alert,
                           dismissText: "Dimiss")
        }
    }
    
    // MARK: Notification Handling
    private func checkForExistingProfile(with notification: Notification) {
        checkForExistingProfile()
    }
    
    private func checkForExistingProfile() {
        profileController.checkForExistingAuthenticatedUserProfile { [weak self] (exists) in
            guard let self = self,
                self.presentedViewController == nil else { return }
        }
    }
    
    @IBSegueAction func detailviewscreen(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: DetailView())
    }
    
}
