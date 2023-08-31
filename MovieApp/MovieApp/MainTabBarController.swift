//
//  MainTabBarController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 25.08.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
    let searchNavigationController = UINavigationController(rootViewController: SearchViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: homeNavigationController,
                       title: "Home",
                       image: UIImage(systemName: "house.fill")
                      ),
            generateVC(viewController: searchNavigationController,
                       title: "Search",
                       image: UIImage(systemName: "magnifyingglass")
                      )
        ]
    }

    private func generateVC(viewController: UIViewController,
                            title: String,
                            image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
//    private func colorOfNavBar() {
//        homeNavigationController.navigationBar.backgroundColor = .black
//        searchNavigationController.navigationBar.backgroundColor = .black
//    }
}
