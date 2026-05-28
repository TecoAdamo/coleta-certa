//
//  AddressView.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import Foundation
import UIKit

final class AddressView: UIView {
    private let addressViewModel = AddressViewModel()
    
    public weak var delegate: AddressViewDelegate?
    
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
    
    private let selectTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Selecione seu Bairro:"
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let neighborhoodSelectButton: UIButton = {
            var config = UIButton.Configuration.plain()
            config.title = "Selecione seu Bairro..."
            config.image = UIImage(systemName: "chevron.down")
            config.imagePlacement = .trailing
            config.imagePadding = 12
            config.cornerStyle = .medium
            config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            
            let button = UIButton(configuration: config)
            button.contentHorizontalAlignment = .leading
            button.backgroundColor = .clear
            button.tintColor = .black
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.layer.borderColor = Colors.borderPrimary.cgColor
            button.showsMenuAsPrimaryAction = true
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    let inputName = CustomInput(
        title: "Informe seu nome:",
        placeholder: "ex: Bruna",
        type: .normal,
        style: .secondary
    )
    
    var userNickName: String {
        inputName.textField.text ?? ""
    }
    
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
        
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupActions(){
        buttonConfirmAddress.setAction { [weak self] in
            self?.delegate?.didTapStart()
        }
    }
    
    private func setupView() {
        
        backgroundColor = Colors.backgroundTertiary
        
        addSubview(label)
        addSubview(textLabel)
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(selectTitleLabel)
        stackView.addArrangedSubview(neighborhoodSelectButton)
        stackView.setCustomSpacing(24, after: neighborhoodSelectButton)
        
        addSubview(inputName)
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
            
            neighborhoodSelectButton.heightAnchor.constraint(equalToConstant: 52),
            
            
            inputName.topAnchor.constraint(equalTo: neighborhoodSelectButton.bottomAnchor, constant: 80),
            inputName.centerXAnchor.constraint(equalTo: centerXAnchor),
            inputName.widthAnchor.constraint(equalToConstant: 300),
            
            buttonConfirmAddress.topAnchor.constraint(equalTo: inputName.bottomAnchor, constant: 80),
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
