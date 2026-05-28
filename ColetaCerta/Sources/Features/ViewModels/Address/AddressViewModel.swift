//
//  OnoboardingViewModel.swift
//  ColetaCerta
//
//  Created by Mateus on 28/05/26.
//

import Foundation

class AddressViewModel {
    var succesResult: (() -> Void)?
    var showToast: ((String) -> Void)?
    
    func itsOkay(userNick: String){
        if userNick.isEmpty {
            showToast?("Informe seu nome para prosseguir.")
        } else {
            succesResult?()
        }
    }
}
