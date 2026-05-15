//
//  InputType.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import UIKit

enum InputType {
    case normal
    case cep
    case numeric
    case uf
    
    var keyboardType: UIKeyboardType {
        switch self {
            case .normal:
            return .default
        case .cep:
            return .numberPad
        case .numeric:
            return .numberPad
        case .uf:
            return .asciiCapable
        }
    }
}
