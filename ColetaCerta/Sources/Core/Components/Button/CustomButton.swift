//
//  CustomButton.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation
import UIKit

final class CustomButton: UIButton {
    
    private var action: (() -> Void)?
    
    init(title: String, style: ButtonStyle, size: ButtonSize) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        
        backgroundColor = style.backgroundColor
        setTitleColor(style.titleColor, for: .normal)
        
        titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor.cgColor
        
        layer.cornerRadius = 12
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setAction(_ action: @escaping () -> Void){
        self.action = action
    }
    
    @objc
    private func buttonTapped(){
        action?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
