//
//  PageView.swift
//  Apollo
//
//  Created by Enrique Gongora on 9/10/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import SwiftUI

struct PageView: View {
    
    var page = Page.getAll.first!
    
    var body: some View {
        VStack {
            Image(page.image)
            VStack {
                Text(page.heading)
                    .font(.title)
                    .bold()
                    .layoutPriority(1)
                    .multilineTextAlignment(.center)
                Text(page.subSubheading)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
            }.padding()
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
