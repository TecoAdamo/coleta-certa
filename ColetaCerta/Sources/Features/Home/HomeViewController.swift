//
//  HomeViewController.swift
//  ColetaCerta
//
//  Created by Mateus on 15/05/26.
//

import Foundation
import UIKit
internal import CoreData

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private var tableItems: [HomeItem] = []
    
    var scheduleData: CollectionSchedule? {
        didSet {
            setupTableItems()
        }
    }
    
    var selectedSuburb: String?
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        setupUI()
        setupTableView()
        
        let persistence = Neighborhood()
        if let user = persistence.fetchUserNeighborhood() {
            let savedName = user.value(forKey: "userName") as? String ?? ""
            homeView.configureWelcomeMessage(with: savedName)
            
            if selectedSuburb == nil {
                selectedSuburb = user.value(forKey: "userNeighborhood") as? String
            }
        }
        
        loadMockData()
    }
    
    private func setupUI(){
        view.backgroundColor = Colors.backgroundCardWhite
    }
    
    private func setupTableView(){
        homeView.tableView.register(
            CollectionCell.self,
            forCellReuseIdentifier: "CollectionCell"
        )
        homeView.tableView.dataSource = self
    }
    
    private func setupTableItems() {
        guard let season = scheduleData?.baixaTemporada else { return }
        
        let organicDays = season.organica.dias
        
        let cardText = DateHelper.getNextCollection(from: organicDays)
        
        if cardText == "Hoje" || cardText == "Amanhã" {
            homeView.textLabel.text = "\(cardText), às \(season.organica.inicio)"
        } else {
            homeView.textLabel.text = "\(cardText), às \(season.organica.inicio)"
        }
        
        var items: [HomeItem] = []
        
        for dia in season.organica.dias {
            items.append(HomeItem(
                diaSemana: dia,
                diaMes: "",
                tipo: .organica,
                horario: season.organica.inicio
            ))
        }
    
        for dia in season.seletiva.dias {
            items.append(HomeItem(
                diaSemana: dia,
                diaMes: "",
                tipo: .seletiva,
                horario: season.seletiva.inicio
            ))
        }
        
        self.tableItems = items
        
        homeView.tableView.reloadData()
    }
    
    private func loadMockData() {
        
        let service = CollectionService()
        let allSchedules = service.loadSchedule()
        
        let suburbSearch = selectedSuburb
        
        if let matchedSchedule = allSchedules.first(where: {$0.bairro.lowercased() == suburbSearch?.lowercased()}) {
            self.scheduleData = matchedSchedule
        } else {
            print("Aviso: O bairro '\(String(describing: suburbSearch))' não foi encontrado no arquivo JSON.")
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CollectionCell",
            for: indexPath
        ) as! CollectionCell
        
        let item = tableItems[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
}
