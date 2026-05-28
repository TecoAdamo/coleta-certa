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
        setupActions()
    }
    
    private func setupUI(){
        view.backgroundColor = Colors.backgroundCardWhite
    }
    
    private func setupActions(){
        onboardingView.primaryButton.addTarget(self, action: #selector(goToManualAddress), for: .touchUpInside)
    }
    
    @objc
    private func goToManualAddress(){
        let vc = AddressViewController(addressViewModel: AddressViewModel())

        navigationController?.pushViewController(vc, animated: true)
    }
    

}
