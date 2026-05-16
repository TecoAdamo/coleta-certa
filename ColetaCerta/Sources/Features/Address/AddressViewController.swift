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
        setupActions()
    }
    
    private func setupUI(){
        view.backgroundColor = Colors.backgroundCardWhite
    }
    
    private func setupActions(){
        addressView.buttonConfirmAddress.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
    }
    
    @objc
    private func handleContinue(){
        
        let cep = addressView.cepInput.textField.text ?? ""
        let streetInput = addressView.streetInput.textField.text ?? ""
        let numberInput = addressView.streetInput.textField.text ?? ""
        let neighborhoodInput = addressView.streetInput.textField.text ?? ""
        let cityInput = addressView.streetInput.textField.text ?? ""
        let stateInput = addressView.streetInput.textField.text ?? ""
        
        if cep.isEmpty || streetInput.isEmpty || numberInput.isEmpty || neighborhoodInput.isEmpty || cityInput.isEmpty || stateInput.isEmpty {
            let alert = UIAlertController(title: "Erro", message: "Preencha todos os campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        let nextViewController = HomeViewController()
        
        navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }
}
