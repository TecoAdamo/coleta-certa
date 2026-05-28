//
//  MainTabBarController.swift
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        setupTabBarAppearance()
    }
    
    private func setupTabs() {
        
        let homeViewController = HomeViewController()
        
        let homeNavigation = UINavigationController(
            rootViewController: homeViewController
        )
        
        homeNavigation.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        
        let settingsViewController = SettingsViewController()
        
        let settingsNavigation = UINavigationController(
            rootViewController: settingsViewController
        )
        
        settingsNavigation.tabBarItem = UITabBarItem(
            title: "Ajustes",
            image: UIImage(systemName: "gearshape"),
            tag: 1
        )
        
        viewControllers = [
            homeNavigation,
            settingsNavigation
        ]
    }
    
    private func setupTabBarAppearance() {
        
        tabBar.tintColor = Colors.accentBrandDark
        
        tabBar.unselectedItemTintColor = .gray
        
    }
}
