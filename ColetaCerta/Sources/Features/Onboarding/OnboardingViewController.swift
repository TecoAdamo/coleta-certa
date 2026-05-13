//
//  OnboardingViewController.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation
import UIKit

final class OnboardingViewController: UIViewController {
    private let onboardingView = OnboardingView()
    
    override func loadView() {
        view = onboardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = Colors.backgroundCardWhite
    }
}
