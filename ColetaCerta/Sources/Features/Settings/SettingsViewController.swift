//
//  SettingsViewController.swift
//  ColetaCerta
//
//  Created by Mateus on 16/05/26.
//

import Foundation
import UIKit

final class SettingsViewController: UIViewController {
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.backgroundCardWhite
        settingsView.delegate = self
    }
}

extension SettingsViewController: SettingsViewDelegate {
    func settingsView(_ view: SettingsView, didChangeNotificationSwitch isOn: Bool) {
        if isOn {
            NotificationManager.shared.requestPermission { [weak self] granted in
                DispatchQueue.main.async {
                    if granted {
                        print("Permissão concedida! Agendando...")
                        
                        NotificationManager.shared.scheduleCollectionNotification(
                            weekday: 2,
                            
                            hour: 14,
                            minute: 20,
                            antecedenceMinutes: 30,
                            title: "Coleta Orgânica Chegando!",
                            body: "Coloque o lixo para fora em breve."
                        )
                    } else {
                        print("Usuário recusou.")
                        self?.settingsView.setNotificationSwitch(isOn: false)
                    }
                }
            }
        } else {
            print("Desligando notificações...")
            NotificationManager.shared.cancelAllNotifications()
        }
    }
    func settingsView(_ view: SettingsView, didSelectAntecedenceMinutes minutes: Int) {
        print("Usuário mudou a antecedência para \(minutes) minutos")
    }
}
