//
//  AddressView.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import Foundation
import UIKit

final class AddressView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Confirme seu endereço"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.textColor = Colors.accentBrandDark
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Esse endereço será usado para buscar os horários da coleta."
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cepInput = CustomInput(
        title: "CEP", placeholder: "ex: 00000-000",
        type: .cep,
        style: .secondary
    )
    
    let streetInput = CustomInput(
        title: "Rua", placeholder: "ex: Rua Olaria",
        type: .normal,
        style: .secondary
    )
    
    let numericInput = CustomInput(
        title: "Número", placeholder: "Nº",
        type: .numeric,
        style: .secondary
    )
    
    let complementInput = CustomInput(
        title: "Complemento(opcional)", placeholder: "Complemento",
        type: .normal,
        style: .secondary
    )
    
    let neighborhoodInput = CustomInput(
        title: "Bairro", placeholder: "ex: Água Branca",
        type: .normal,
        style: .secondary
    )
    
    let cityInput = CustomInput(
        title: "Cidade", placeholder: "Cidade",
        type: .normal,
        style: .secondary
    )
    
    let ufInput = CustomInput(
        title: "UF", placeholder: "UF",
        type: .uf,
        style: .secondary
    )
    
    let buttonConfirmAddress = CustomButton(title: "Confirmar endereço", style: .primary, size: .medium)
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let numberComplementStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let cityUfStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = Colors.backgroundTertiary
        
        addSubview(label)
        addSubview(textLabel)
        
        addSubview(stackView)
        
        numberComplementStack.addArrangedSubview(numericInput)
        numberComplementStack.addArrangedSubview(complementInput)
        
        cityUfStack.addArrangedSubview(cityInput)
        cityUfStack.addArrangedSubview(ufInput)
        
        stackView.addArrangedSubview(cepInput)
        stackView.addArrangedSubview(streetInput)
        stackView.addArrangedSubview(numberComplementStack)
        stackView.addArrangedSubview(neighborhoodInput)
        stackView.addArrangedSubview(cityUfStack)
        
        addSubview(buttonConfirmAddress)
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            textLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            stackView.topAnchor.constraint(
                equalTo: textLabel.topAnchor,
                constant: 72
            ),
            
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            
            stackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            
            numericInput.widthAnchor.constraint(equalToConstant: 90),
            
            ufInput.widthAnchor.constraint(equalToConstant: 100),
            
            buttonConfirmAddress.topAnchor.constraint(equalTo: ufInput.bottomAnchor, constant: 80),
            buttonConfirmAddress.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonConfirmAddress.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            
            buttonConfirmAddress.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            buttonConfirmAddress.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
