//
//  CustomInput.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import Foundation
import UIKit

final class CustomInput: UITextField {
    
    private let inputType: InputType
    private let inputStyle: InputStyle
    
    init(placeholder: String, type: InputType, style: InputStyle) {
        self.inputType = type
        self.inputStyle = style
        
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {

        
        keyboardType = inputType.keyboardType
        
        backgroundColor = inputStyle.backgroundColor
        
        textColor = .white
        
        layer.borderWidth = inputStyle.borderWidth
        layer.borderColor = inputStyle.borderColor.cgColor
        
        layer.cornerRadius = 12
        
        autocorrectionType = .no
        
        autocapitalizationType = .none
        
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        leftViewMode = .always
    }
}
