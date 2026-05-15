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
