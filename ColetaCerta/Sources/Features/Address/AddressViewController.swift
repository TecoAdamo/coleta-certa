//
//  AddressViewController.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import Foundation
import UIKit

final class AddressViewController: UIViewController {
    private let addressView = AddressView()
    
    override func loadView() {
        view = addressView
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
