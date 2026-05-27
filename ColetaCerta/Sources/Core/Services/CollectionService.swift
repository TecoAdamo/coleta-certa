//
//  Untitled.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import Foundation

final class CollectionService {
    func loadSchedule() -> [CollectionSchedule] {
        guard let url = Bundle.main.url(forResource: "collection_schedule", withExtension: "json"
        ) else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            _ = JSONDecoder()
            let schedules = try JSONDecoder().decode([CollectionSchedule].self, from: data)
            
            return schedules
        } catch {
            print(error)
            return []
        }
    }
}
