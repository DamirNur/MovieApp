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
                       title: R.Strings.TabBar.home,
                       image: R.Images.TabBar.home
                      ),
            generateVC(viewController: searchNavigationController,
                       title: R.Strings.TabBar.search,
                       image: R.Images.TabBar.search
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
}
