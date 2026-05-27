//
//  SettingsView.swift
//  ColetaCerta
//
//  Created by Mateus on 16/05/26.
//

import Foundation
import UIKit

final class SettingsView: UIView {
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Ajustes"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleNotification: UILabel = {
        let label = UILabel()
        label.text = "Notificações"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cardNotification: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = 12
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.15
        card.layer.shadowOffset = CGSize(width: 0, height: 4)
        card.layer.shadowRadius = 8
        card.layer.masksToBounds = false
        return card
    }()
    
    private let bellIcon: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = Colors.accentBrand
        iv.image = UIImage(systemName: "bell.fill")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ativar Notificações"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Receba lembretes 30 minutos antes da coleta"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let notificationsSwitch: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.onTintColor = .systemGreen
        return sw
    }()
    
    private lazy var textStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 2
        return stack
    }()

    let titleTimeNotification: UILabel = {
        let label = UILabel()
        label.text = "Antecedência dos avisos"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cardNotificationTime: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = 12
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.15
        card.layer.shadowOffset = CGSize(width: 0, height: 4)
        card.layer.shadowRadius = 8
        card.layer.masksToBounds = false
        return card
    }()
    
    private let timerIcon: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = Colors.accentBrand
        iv.image = UIImage(systemName: "timer")
        return iv
    }()
    
    private let titleLabelTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Me avise com"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let timeSelectButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("30 minutos", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        btn.tintColor = .systemGray
        btn.contentHorizontalAlignment = .trailing
        
        let chevron = UIImage(systemName: "chevron.down")
        btn.setImage(chevron, for: .normal)
        btn.semanticContentAttribute = .forceRightToLeft
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(textLabel)
        addSubview(titleNotification)
        addSubview(cardNotification)
        
        cardNotification.addSubview(bellIcon)
        cardNotification.addSubview(textStack)
        cardNotification.addSubview(notificationsSwitch)
        
        addSubview(titleTimeNotification)
        
        addSubview(cardNotificationTime)
        cardNotificationTime.addSubview(timerIcon)
        cardNotificationTime.addSubview(titleLabelTime)
        cardNotificationTime.addSubview(timeSelectButton)
        
        updateSubtitleText(with: "30 minutos")
        
        notificationsSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        notificationsSwitch.isOn = false
        updateNotificationState(isEnable: false)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleNotification.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 30),
            titleNotification.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            cardNotification.topAnchor.constraint(equalToSystemSpacingBelow: titleNotification.bottomAnchor, multiplier: 2),
            cardNotification.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            cardNotification.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            cardNotification.heightAnchor.constraint(equalToConstant: 100),
            
            bellIcon.leadingAnchor.constraint(equalTo: cardNotification.leadingAnchor, constant: 16),
            bellIcon.centerYAnchor.constraint(equalTo: cardNotification.centerYAnchor),
            bellIcon.widthAnchor.constraint(equalToConstant: 28),
            bellIcon.heightAnchor.constraint(equalToConstant: 28),
            
            notificationsSwitch.trailingAnchor.constraint(equalTo: cardNotification.trailingAnchor, constant: -16),
            notificationsSwitch.centerYAnchor.constraint(equalTo: cardNotification.centerYAnchor),
            
            textStack.leadingAnchor.constraint(equalTo: bellIcon.trailingAnchor, constant: 12),
            textStack.trailingAnchor.constraint(lessThanOrEqualTo: notificationsSwitch.leadingAnchor, constant: -12),
            textStack.centerYAnchor.constraint(equalTo: cardNotification.centerYAnchor),
            textStack.topAnchor.constraint(greaterThanOrEqualTo: cardNotification.topAnchor, constant: 14),
            textStack.bottomAnchor.constraint(lessThanOrEqualTo: cardNotification.bottomAnchor, constant: -14),
            
            titleTimeNotification.topAnchor.constraint(equalTo: cardNotification.bottomAnchor, constant: 30),
            titleTimeNotification.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            cardNotificationTime.topAnchor.constraint(equalToSystemSpacingBelow: titleTimeNotification.bottomAnchor, multiplier: 2),
            cardNotificationTime.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            cardNotificationTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            cardNotificationTime.heightAnchor.constraint(equalToConstant: 100),
            
            timerIcon.leadingAnchor.constraint(equalTo: cardNotificationTime.leadingAnchor, constant: 16),
            timerIcon.centerYAnchor.constraint(equalTo: cardNotificationTime.centerYAnchor),
            timerIcon.widthAnchor.constraint(equalToConstant: 28),
            timerIcon.heightAnchor.constraint(equalToConstant: 28),
            
            titleLabelTime.leadingAnchor.constraint(equalTo: timerIcon.trailingAnchor, constant: 22),
            titleLabelTime.centerYAnchor.constraint(equalTo: cardNotificationTime.centerYAnchor),
            titleLabelTime.trailingAnchor.constraint(lessThanOrEqualTo: timeSelectButton.leadingAnchor, constant: -12),
            
            timeSelectButton.centerYAnchor.constraint(equalTo: cardNotificationTime.centerYAnchor),
            timeSelectButton.trailingAnchor.constraint(equalTo: cardNotificationTime.trailingAnchor, constant: -30)
        ])
        
        if #available(iOS 14.0, *) {
            let minutes30 = UIAction(title: "30 minutos") { [weak self] _ in
                self?.timeSelectButton.setTitle("30 minutos", for: .normal)
                self?.updateSubtitleText(with: "30 minutos")
            }
            
            let hour1 = UIAction(title: "1 hora") { [weak self] _ in
                self?.timeSelectButton.setTitle("1 hora", for: .normal)
                self?.updateSubtitleText(with: "1 hora")
            }
            
            timeSelectButton.menu = UIMenu(children: [minutes30, hour1])
            timeSelectButton.showsMenuAsPrimaryAction = true
        }
    }
    
    private func updateSubtitleText(with time: String){
        subtitleLabel.text = "Receba lembretes \(time) antes da coleta"
    }
    private func updateNotificationState(isEnable: Bool){
        bellIcon.tintColor = isEnable ? Colors.accentBrand : Colors.textSecondary
    }
    @objc private func switchChanged(_ sender: UISwitch) {
        updateNotificationState(isEnable: sender.isOn)
    }
}

