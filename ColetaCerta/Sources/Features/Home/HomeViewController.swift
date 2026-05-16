//
//  HomeViewController.swift
//  ColetaCerta
//
//  Created by Mateus on 15/05/26.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
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
