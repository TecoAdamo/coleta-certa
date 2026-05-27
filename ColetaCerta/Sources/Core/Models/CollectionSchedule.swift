//
//  CollectionSchedule.swift
//  ColetaCerta
//
//  Created by Mateus on 14/05/26.
//

import Foundation

struct CollectionSchedule: Codable {
    let bairro: String
    let baixaTemporada: SeasonSchedule
    let altaTemporada: SeasonSchedule
}
struct SeasonSchedule: Codable {
    let organica: GarbageSchedule
    let seletiva: GarbageSchedule
}
struct GarbageSchedule: Codable {
    let dias: [String]
    let inicio: String
    let fim: String
}
enum GarbageType: CaseIterable {
    case organica
    case seletiva
    
    var title: String {
        switch self {
        case .organica: return "Orgânica"
        case .seletiva: return "Reciclável"
        }
    }
    
    var iconName: String {
        switch self {
        case .organica: return "leaf"
        case .seletiva: return "trash"
        }
    }
}
