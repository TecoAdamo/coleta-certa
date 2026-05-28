//
//  SplashViewController.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation
import UIKit

internal import CoreData

final class SplashViewController: UIViewController {
    private let splashView = SplashView()
    
    override func loadView() {
        view = splashView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkUserStatusAndNavigate()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = Colors.backgroundPrimary
    }
    
    private func checkUserStatusAndNavigate(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [ weak self ] in
            guard let self = self else { return }
            
            let persistence = Neighborhood()
            
            if let user = persistence.fetchUserNeighborhood(),
                let savedName = user.value(forKey: "userName") as? String,
                !savedName.isEmpty {
                    
                    let tabBarController = MainTabBarController()
                    AppRouter.setRootViewController(tabBarController)
                } else {
                    let onboardingViewController = OnboardingViewController()
                    self.navigationController?.pushViewController(onboardingViewController, animated: true)
                }
            }
        }
    }

