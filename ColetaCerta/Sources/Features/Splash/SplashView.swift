//
//  SplashView.swift
//  ColetaCerta
//
//  Created by Mateus on 13/05/26.
//

import Foundation
import UIKit

final class SplashView: UIView {
    
    let logoSplash: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoNameSplash: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logoName"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "A coleta certa, na hora certa."
        label.font = .systemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = Colors.backgroundTertiary
        
        addSubview(logoSplash)
        addSubview(logoNameSplash)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            logoSplash.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoSplash.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40),
            logoSplash.widthAnchor.constraint(equalToConstant: 180),
            logoSplash.heightAnchor.constraint(equalToConstant: 180),

            logoNameSplash.topAnchor.constraint(equalTo: logoSplash.bottomAnchor, constant: -62),
            logoNameSplash.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoNameSplash.widthAnchor.constraint(equalToConstant: 260),
            logoNameSplash.heightAnchor.constraint(equalToConstant: 160),
            
            label.topAnchor.constraint(equalTo: logoNameSplash.bottomAnchor, constant: -52),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
