//
//  Notifications.swift
//  Apollo
//
//  Created by Enrique Gongora on 9/22/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let oktaAuthenticationSuccessful = Notification.Name("oktaAuthenticationSuccessful")
    static let oktaAuthenticationFailed = Notification.Name("oktaAuthenticationFailed")
    static let oktaAuthenticationExpired = Notification.Name("oktaAuthenticationExpired")
}
