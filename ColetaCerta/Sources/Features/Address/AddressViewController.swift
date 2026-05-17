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
        let numberInput = addressView.numericInput.textField.text ?? ""
        let neighborhoodInput = addressView.neighborhoodInput.textField.text ?? ""
        let cityInput = addressView.cityInput.textField.text ?? ""
        let ufInput = addressView.ufInput.textField.text ?? ""
        
        if cep.isEmpty || streetInput.isEmpty || numberInput.isEmpty || neighborhoodInput.isEmpty || cityInput.isEmpty || ufInput.isEmpty {
            let alert = UIAlertController(title: "Erro", message: "Preencha todos os campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            let service = CollectionService()
            let allSchedules = service.loadSchedule()
            
            let neighborhoodExists = allSchedules.contains { $0.bairro.lowercased() == neighborhoodInput.lowercased() }
            
            if !neighborhoodExists {
                let alert = UIAlertController(title: "Erro", message: "Bairro não encontrado", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            
            let nextViewController = HomeViewController()
            
            nextViewController.selectedSuburb = neighborhoodInput
            
            addressView.cepInput.textField.text = ""
            addressView.streetInput.textField.text = ""
            addressView.numericInput.textField.text = ""
            addressView.neighborhoodInput.textField.text = ""
            addressView.cityInput.textField.text = ""
            addressView.ufInput.textField.text = ""
            
            navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
        }
    }
}
