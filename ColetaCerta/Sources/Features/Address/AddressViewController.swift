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
    
    private let addressViewModel: AddressViewModel
    
    private var selectedNeighborhood: String?
    
    override func loadView() {
        view = addressView
    }
    
    init(addressViewModel: AddressViewModel) {
        self.addressViewModel = addressViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        setupUI()
        setupActions()
        setupNeighborhood()
    }
    
    private func setupUI(){
        view.backgroundColor = Colors.backgroundCardWhite
    }
    
    private func setupActions(){
        addressView.buttonConfirmAddress.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
    }
    
    private func setupNeighborhood(){
        let service = CollectionService()
        let allSchedules = service.loadSchedule()
        
        let menuActions = allSchedules.map{ schedule in
            return UIAction(title: schedule.bairro, image: nil) {[weak self ] action in
                guard let self = self else { return }
                
                self.selectedNeighborhood = schedule.bairro
                
                self.addressView.neighborhoodSelectButton.setTitle(schedule.bairro, for: .normal)
            }
        }
        let neighborhoodMenu = UIMenu(title: "Bairros disponíveis:", children: menuActions)
        addressView.neighborhoodSelectButton.menu = neighborhoodMenu
    }
    
    @objc
    private func handleContinue(){
            
            guard let neighborhoodInput = selectedNeighborhood, !neighborhoodInput.isEmpty else {
                let alert = UIAlertController(
                    title: "Atenção",
                    message: "Por favor, selecione um bairro na lista para continuar.",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
        
        let nickName = addressView.userNickName
        if nickName.isEmpty {
            let alert = UIAlertController(
                title: "Atenção",
                message: "Informe seu nome para prosseguir.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let persistence = Neighborhood()
        persistence.saveUserNeighborhood(name: nickName, neighborhoodName: neighborhoodInput)
        
        addressViewModel.itsOkay(userNick: nickName)
            
        let tabBarController = MainTabBarController()

        if let homeNavigation = tabBarController.viewControllers?.first as? UINavigationController,
           let homeViewController = homeNavigation.viewControllers.first as? HomeViewController {

            homeViewController.selectedSuburb = neighborhoodInput
        }

        AppRouter.setRootViewController(tabBarController)
    }
}

