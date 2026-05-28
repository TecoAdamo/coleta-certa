//
//  CustomInput.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import UIKit

final class CustomInput: UIView {
    
    private let inputType: InputType
    private let inputStyle: InputStyle
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(
        title: String,
        placeholder: String,
        type: InputType,
        style: InputStyle
    ) {
        self.inputType = type
        self.inputStyle = style
        
        super.init(frame: .zero)
        
        titleLabel.text = title
        textField.placeholder = placeholder
        
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(textField)
        
        textField.keyboardType = inputType.keyboardType
        
        textField.backgroundColor = inputStyle.backgroundColor
        
        textField.textColor = .black
        
        textField.layer.borderWidth = inputStyle.borderWidth
        
        textField.layer.borderColor = inputStyle.borderColor.cgColor
        
        textField.layer.cornerRadius = 8
        
        textField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 16, height: 0)
        )
        
        textField.leftViewMode = .always
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textField.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 6
            ),
            
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 52),
            
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupActions(){
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc
    private func textDidChange(){
        switch inputType {
        case .normal:
            break
        case .cep:
            maskCEP()
        case .numeric:
            break
        case .uf:
            break
        }
    }
    
    private func maskCEP() {
            guard let text = textField.text else { return }
            
            let cleanCEP = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            
            let mask = "#####-###"
            
            textField.text = applyMask(mask: mask, to: cleanCEP)
        }
    
    private func applyMask(mask: String, to value: String) -> String {
        var result = ""
        var index = value.startIndex
        
        for ch in mask where index < value.endIndex {
            if ch == "#" {
                result.append(value[index])
                index = value.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
