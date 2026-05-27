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
    }
}
