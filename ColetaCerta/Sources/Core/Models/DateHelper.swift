//
//  DateHelper.swift
//  ColetaCerta
//
//  Created by Mateus on 19/05/26.
//

import Foundation

final class DateHelper {
    static func getCurrentDayOfWeek() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "EEEE"
        
        let dayOfWeek = formatter.string(from: date)
        
        let shortDay = String(dayOfWeek.prefix(3))
        
        return shortDay.folding(options: .diacriticInsensitive, locale: .current).lowercased()
    }
    
    static func getNextCollection(from availableDays: [String]) -> String {
        let today = getCurrentDayOfWeek()
        
        let cleanAvaibleDays = availableDays.map{
            $0.folding(options: .diacriticInsensitive, locale: .current).lowercased()
        }
        
        if cleanAvaibleDays.contains(today.lowercased()) {
            return "Hoje"
        }
        
        let daysOrder = ["dom", "seg", "ter", "qua", "qui", "sex", "sab"]
        
        guard let todayIndex = daysOrder.firstIndex(of: today.lowercased()) else { return "Não agendado"}
        
        var shortestDistance = 8
        var nextDayName = ""
        
        for day in cleanAvaibleDays {
            if let targetIndex = daysOrder.firstIndex(of: day){
                var distance = targetIndex - todayIndex
                
                if distance < 0 {
                    distance += 7
                }
                
                if distance < shortestDistance {
                    shortestDistance = distance
                    let displayNames = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"]
                    nextDayName = displayNames[targetIndex]
                }
            }
        }
        if shortestDistance == 1 {
            return "Amanhã"
        } else if shortestDistance < 8 {
            return "Próxima: \(nextDayName)"
        } else {
            return "Não agendado"
        }
    }
    
    private static func getCurrentDateFormatted() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: Date())
    }
}
