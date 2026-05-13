//
//  ButtonStyle.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import UIKit

enum ButtonStyle {
    
    case primary
    case secondary
    
    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return Colors.accentBrand
        case .secondary:
            return Colors.backgroundCardWhite
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .primary:
            return .white
            
        case .secondary:
            return .black
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .primary:
            return 0
            
        case .secondary:
            return 1
        }
    }
    
    var borderColor: UIColor {
        switch self {
        case .primary:
            return .clear
            
        case .secondary:
            return Colors.accentBrand
        }
    }
}
