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

        setupUI()
    }


    private func setupUI() {
        view.backgroundColor = Colors.backgroundPrimary
    }
}
