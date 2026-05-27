//
//  OnboardingView.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation
import UIKit

final class OnboardingView: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Vamos encontrar os horários da coleta na sua região!"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.textColor = Colors.accentBrandDark
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "📍 Para isso, precisamos saber \nonde você mora."
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgOnboarding: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "coletaOnboarding"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let primaryButton = CustomButton(
        title: "Informar meu endereço",
        style: .primary,
        size: .large
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = Colors.backgroundTertiary
        
        addSubview(label)
        addSubview(textLabel)
        addSubview(imgOnboarding)
        addSubview(primaryButton)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            textLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            imgOnboarding.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 40),
            imgOnboarding.centerXAnchor.constraint(equalTo: centerXAnchor),
            imgOnboarding.widthAnchor.constraint(equalToConstant: 300),
            imgOnboarding.heightAnchor.constraint(equalToConstant: 300),
            
            primaryButton.topAnchor.constraint(equalTo: imgOnboarding.bottomAnchor, constant: 80),
            primaryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            primaryButton.widthAnchor.constraint(equalToConstant: 300),
            primaryButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
