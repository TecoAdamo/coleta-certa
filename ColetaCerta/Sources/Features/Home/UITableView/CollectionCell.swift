//
//  CollectionCell.swift
//  ColetaCerta
//
//  Created by Mateus on 16/05/26.
//
//  CollectionCell.swift
//  ColetaCerta
//
//  Created by Mateus on 16/05/26.
//

import UIKit

final class CollectionCell: UITableViewCell {
    
    private let weekDayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let monthDayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with item: HomeItem) {
        weekDayLabel.text = item.diaSemana
        monthDayLabel.text = item.diaMes
        titleLabel.text = item.tipo.title
        timeLabel.text = item.horario
        
        if item.tipo == .organica {
            typeIconImageView.image = UIImage(systemName: "leaf.fill")
            typeIconImageView.tintColor = .systemGreen
            
        } else {
            typeIconImageView.image = UIImage(systemName: "arrow.3.trianglepath")
            typeIconImageView.tintColor = .systemBlue
        }
    }
    
    private func setupCell() {
        contentView.addSubview(weekDayLabel)
        contentView.addSubview(monthDayLabel)
        contentView.addSubview(typeIconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            weekDayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            weekDayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            monthDayLabel.topAnchor.constraint(equalTo: weekDayLabel.bottomAnchor, constant: 2),
            monthDayLabel.centerXAnchor.constraint(equalTo: weekDayLabel.centerXAnchor),
            monthDayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            typeIconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            typeIconImageView.leadingAnchor.constraint(equalTo: weekDayLabel.trailingAnchor, constant: 25),
            typeIconImageView.widthAnchor.constraint(equalToConstant: 32),
            typeIconImageView.heightAnchor.constraint(equalToConstant: 26),
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: typeIconImageView.trailingAnchor, constant: 15),
            
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            arrowImageView.widthAnchor.constraint(equalToConstant: 12),
            arrowImageView.heightAnchor.constraint(equalToConstant: 18),
            
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -12)        ])
    }
}
