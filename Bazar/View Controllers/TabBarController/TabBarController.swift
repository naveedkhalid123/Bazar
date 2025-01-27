//
//  TabBarController.swift
//  Bazar
//
//  Created by Naveed Khalid on 27/01/2025.
//



import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.selectedIndex = 0
        self.tabBar.backgroundColor = .appColor(.lightGrey)
        self.tabBar.tintColor = .appColor(.purple)
        self.tabBar.unselectedItemTintColor = .appColor(.grey)
        
        self.delegate = self
    }

    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(named: "Home")?.withRenderingMode(.alwaysTemplate) ?? UIImage(), vc: HomeController())
        let history = self.createNav(with: "Category", and: UIImage(named: "category")?.withRenderingMode(.alwaysTemplate) ?? UIImage(), vc: CategoryController())
        let workout = self.createNav(with: "Cart", and: UIImage(named: "Buy")?.withRenderingMode(.alwaysTemplate) ?? UIImage(), vc: CartController())
        let exercise = self.createNav(with: "Profile", and: UIImage(named: "Profile")?.withRenderingMode(.alwaysTemplate) ?? UIImage(), vc: ProfileController())
        self.setViewControllers([home, history, workout, exercise], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        nav.navigationBar.standardAppearance = appearance
        nav.isNavigationBarHidden = true
        nav.navigationBar.scrollEdgeAppearance = appearance
        nav.navigationBar.compactAppearance = appearance
        nav.navigationBar.isTranslucent = false

        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.tabBarItem.selectedImage = image.withRenderingMode(.alwaysTemplate)

        return nav
    }
}
