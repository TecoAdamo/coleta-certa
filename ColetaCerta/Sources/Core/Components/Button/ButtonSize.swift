//
//  ButtonSize.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation

enum ButtonSize {
    case small
    case medium
    case large
    
    var height: CGFloat {
        switch self {
        case .small:
            return 40
            
        case .medium:
            return 52
            
        case .large:
            return 60
        }
    }
}
