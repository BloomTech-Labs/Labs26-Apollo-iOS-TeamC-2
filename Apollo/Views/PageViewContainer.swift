//
//  PageViewContainer.swift
//  Apollo
//
//  Created by Enrique Gongora on 9/10/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import SwiftUI

struct PageViewContainer<Page: View>  : View {
    
    @State var currentPage = 0
    @State var buttonText = "Next"
    var viewControllers: [UIHostingController<Page>]
    var presentSignupView: (()->()) = {}
    
    
    var body: some View {
        
        return VStack {
            PageViewController(controllers: viewControllers, currentPage: self.$currentPage)
            PageIndicator(currentIndex: self.currentPage)
            VStack {
                Button(action: {
                    if self.currentPage < self.viewControllers.count - 1{
                        self.currentPage += 1
                    } else {
                        self.presentSignupView()
                    }
                }) {
                    HStack {
                        Text(currentPage == viewControllers.count - 1 ? "Get started" : "Next" )
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .accentColor(Color.white)
                            .background(Color("accentColor"))
                            .cornerRadius(30)
                    }.padding()
                }
            }.padding(.vertical)
        }.background(Color.white)
    }
}

struct PageViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        PageViewContainer( viewControllers: Page.getAll.map({  UIHostingController(rootView: PageView(page: $0) )  }))
    }
}
