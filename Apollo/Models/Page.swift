//
//  Page.swift
//  Apollo
//
//  Created by Enrique Gongora on 9/10/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import Foundation

struct Page: Identifiable {
    
    // MARK: - Properties
    let id: UUID
    let image: String
    let heading: String
    let subSubheading: String
    
    // MARK: - Computed Properties
    static var getAll: [Page] {
        [
            Page(id: UUID(), image: "screen-1", heading: "Welcome to Apollo", subSubheading: "The future of management is here!"),
            Page(id: UUID(), image: "screen-2", heading: "Keep track of your progress", subSubheading: "See how everyone is doing through easy to use surveys"),
            Page(id: UUID(), image: "screen-3", heading: "Setup your goals", subSubheading: "With reminders, you're in control. Choose the frequency of how often surveys are delivered. "),
            Page(id: UUID(), image: "screen-4", heading: "Using Apollo is a breeze", subSubheading: "We put the surveys front and center, so you have all the information you need at a moments glance")
        ]
    }
}
