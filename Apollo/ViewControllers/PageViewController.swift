//
//  PageViewController.swift
//  Apollo
//
//  Created by Enrique Gongora on 9/10/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
    // MARK: - View Controller Properties
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    
    
    // MARK: - Methods
    // This will initialize the controller that will be used in our SwiftUI app. It will return a UIPageViewController
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        // Initialize the PageViewController
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        // Set the Data Source and the Delegate to the context coordinator
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        // Set the background color of all the pages
        controllers.forEach({$0.view.backgroundColor = UIColor(named: "bgColor") })
        pageViewController.view.backgroundColor = UIColor(named: "bgColor")
        
        // Return the pageViewController
        return pageViewController
    }
    
    // This will make any updates to our controller once it has been created in our makeUIViewController method
    func updateUIViewController(_ pageViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageViewController>) {
        
        // This updates the page controller to show the current page after the user has scrolled
        pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    // This method instantiates the coordinator
    func makeCoordinator() -> PageViewController.Coordinator {
        Coordinator(self)
    }
    
    // This class will coordinate the interaction between SwiftUI and the controller we are using, including handling the datasource and delegate conformance.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        // MARK: - Coordinator Properties
        // This property will keep a reference to the parent struct that will be set when the coordinator is instantiated
        var parent: PageViewController
        
        init(_ controller: PageViewController) {
            self.parent = controller
        }
        
        // MARK: - Coordinator Methods
        // These two methods will be the data source to tell the controller which page to show from the parent's controllers array
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index  = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return nil
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index  = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == parent.controllers.count - 1{
                return nil
            }
            
            return parent.controllers[index + 1]
        }
        
        // This delegate method will capture the index that the user has scrolled to and set it to the Binding property we created.
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
