//
//  Colors.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation
import UIKit

enum Colors {
    
    // MARK: - Backgrounds
    
    static let backgroundPrimary = UIColor(hex: "#07110B")
    static let backgroundSecondary = UIColor(hex: "#0D1B13")
    static let backgroundTertiary = UIColor(hex: "#13241A")
    
    static let backgroundCard = UIColor(hex: "#F8F8F8")
    static let backgroundCardSecondary = UIColor(hex: "#EEF7F0")
    
    // MARK: - Brand
    
    static let accentBrand = UIColor(hex: "#45C15A")
    static let accentBrandDark = UIColor(hex: "#2D8F43")
    static let accentBrandLight = UIColor(hex: "#9BE7A7")
    
    // MARK: - Collection Types
    
    static let organicGreen = UIColor(hex: "#4CAF50")
    static let recyclableBlue = UIColor(hex: "#3B82F6")
    static let noCollectionGray = UIColor(hex: "#B5B5B5")
    
    // MARK: - Feedback
    
    static let success = UIColor(hex: "#43C463")
    static let warning = UIColor(hex: "#FFB547")
    static let error = UIColor(hex: "#FF5E5E")
    
    // MARK: - Text
    
    static let textHeading = UIColor(hex: "#111111")
    static let textPrimary = UIColor(hex: "#222222")
    static let textSecondary = UIColor(hex: "#666666")
    static let textTertiary = UIColor(hex: "#8E8E93")
    
    static let textWhite = UIColor(hex: "#FFFFFF")
    static let textInvert = UIColor(hex: "#0B1A12")
    
    static let textPlaceholder = UIColor(hex: "#A1A1A1")
    
    // MARK: - Borders
    
    static let borderPrimary = UIColor(hex: "#E5E5E5")
    static let borderSecondary = UIColor(hex: "#D6E7DA")
    
    // MARK: - Gradients
    
    static let gradientStart = UIColor(hex: "#0A2013")
    static let gradientMiddle = UIColor(hex: "#10351D")
    static let gradientEnd = UIColor(hex: "#45C15A")
}

extension UIColor {
    
    convenience init(hex: String) {
        var hexFormatted: String = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexFormatted).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(
            red: red,
            green: green,
            blue: blue,
            alpha: 1.0
        )
    }
}
