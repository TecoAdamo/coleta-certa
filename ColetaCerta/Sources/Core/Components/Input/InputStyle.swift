//
//  InputStyle.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//
import UIKit

enum InputStyle {
    
    case primary
    case secondary

    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return .clear
        case .secondary:
            return .clear
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .primary:
            return 0
            
        case .secondary:
            return 0.7
        }
    }
    
    var borderColor: UIColor {
        switch self {
        case .primary:
            return .clear
            
        case .secondary:
            return .gray
        }
    }
}
