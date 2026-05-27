//
//  HomeView.swift
//  ColetaCerta
//
//  Created by Mateus on 15/05/26.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.accentBrandDark
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textPrimaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Próxima coleta"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje, às 19:00"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let organicIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "leaf.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let organicLabel: UILabel = {
        let label = UILabel()
        label.text = "Orgânico"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "Calendário Semanal"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 12
        return tableView
    }()
    
    private let containerMessage: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundCardMessages
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lightIcon: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
        imageView.image = UIImage(systemName: "lightbulb.max", withConfiguration: config)
        imageView.tintColor = Colors.accentBrandDark
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelContainerMessage: UILabel = {
        let label = UILabel()
        label.text = "Dica sustentável"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabelContainerMessage: UILabel = {
        let label = UILabel()
        label.text = "Lave as embalagens recicláveis \nantes de descartar. \nPequenas atitudes fazem \na diferença. ♻️"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .gray
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
        
        addSubview(container)
        
        container.addSubview(textPrimaryLabel)
        container.addSubview(textLabel)
        
        container.addSubview(organicIcon)
        container.addSubview(organicLabel)
        
        addSubview(calendarLabel)
        addSubview(tableView)
        
        tableView.rowHeight = 60
        tableView.estimatedRowHeight = 60
        
        let headerSpacer = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12))
        headerSpacer.backgroundColor = .clear
        tableView.tableHeaderView = headerSpacer
        let footerSpacer = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12))
        footerSpacer.backgroundColor = .clear
        tableView.tableFooterView = footerSpacer
        
        addSubview(containerMessage)
        
        containerMessage.addSubview(lightIcon)
        containerMessage.addSubview(labelContainerMessage)
        containerMessage.addSubview(subLabelContainerMessage)
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 180)

        footerView.addSubview(containerMessage)
        tableView.tableFooterView = footerView
        
        tableView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([

            container.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 22
            ),
            container.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            container.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            container.heightAnchor.constraint(equalToConstant: 140),
            
            textPrimaryLabel.topAnchor.constraint(
                equalTo: container.topAnchor,
                constant: 20
            ),            textPrimaryLabel.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: 20
            ),
            textLabel.topAnchor.constraint(
                equalTo: textPrimaryLabel.bottomAnchor,
                constant: 8
            ),
            textLabel.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: 20
            ),
            
            organicIcon.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: 20
            ),
            organicIcon.bottomAnchor.constraint(
                equalTo: container.bottomAnchor,
                constant: -20
            ),
            organicIcon.widthAnchor.constraint(equalToConstant: 16),
            organicIcon.heightAnchor.constraint(equalToConstant: 16),

            organicLabel.centerYAnchor.constraint(
                equalTo: organicIcon.centerYAnchor
            ),
            organicLabel.leadingAnchor.constraint(
                equalTo: organicIcon.trailingAnchor,
                constant: 6
            ),
            
            calendarLabel.topAnchor.constraint(equalTo: organicLabel.bottomAnchor, constant: 36),
            calendarLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            calendarLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            
            tableView.topAnchor.constraint(
                equalTo: container.bottomAnchor,
                constant: 50
            ),

            tableView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),

            tableView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),

            tableView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor
            ),

            containerMessage.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 20),
            containerMessage.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            containerMessage.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
            containerMessage.heightAnchor.constraint(equalToConstant: 140),
            
            lightIcon.topAnchor.constraint(equalTo: containerMessage.topAnchor, constant: 34),
            lightIcon.leadingAnchor.constraint(equalTo: containerMessage.leadingAnchor, constant: 16),
            lightIcon.heightAnchor.constraint(equalToConstant: 50),
            lightIcon.widthAnchor.constraint(equalToConstant: 50),
            
            labelContainerMessage.topAnchor.constraint(equalTo: containerMessage.topAnchor, constant: 24),
            labelContainerMessage.leadingAnchor.constraint(equalTo: lightIcon.leadingAnchor, constant: 70),
            
            subLabelContainerMessage.topAnchor.constraint(equalTo: containerMessage.topAnchor, constant: 44),
            subLabelContainerMessage.leadingAnchor.constraint(equalTo: lightIcon.leadingAnchor, constant: 70),
        ])
        
    }
}

