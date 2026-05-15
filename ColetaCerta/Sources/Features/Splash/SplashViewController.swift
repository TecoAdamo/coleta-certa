//
//  SplashViewController.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation
import UIKit

final class SplashViewController: UIViewController {
    private let splashView = SplashView()
    
    override func loadView() {
        view = splashView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigateToOnboarding()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = Colors.backgroundPrimary
    }
    
    private func navigateToOnboarding(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let onboardingViewController = OnboardingViewController()
            
            self.navigationController?.pushViewController(
                onboardingViewController,
                animated: true
            )
        }
    }
}
