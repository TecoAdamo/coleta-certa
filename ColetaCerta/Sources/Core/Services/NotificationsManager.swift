//
//  NotificationsManager.swift
//  ColetaCerta
//
//  Created by Mateus on 27/05/26.
//

import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()
    private init() {}
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func scheduleCollectionNotification(weekday: Int, hour: Int, minute: Int, antecedenceMinutes: Int, title: String, body: String) {
        let center = UNUserNotificationCenter.current()
        
        var collectionComponents = DateComponents()
        collectionComponents.weekday = weekday
        collectionComponents.hour = hour
        collectionComponents.minute = minute
        
        let calendar = Calendar.current
        guard let collectionDate = calendar.nextDate(after: Date(), matching: collectionComponents, matchingPolicy: .nextTime) else { return }
        
        guard let notificationDate = calendar.date(byAdding: .minute, value: -antecedenceMinutes, to: collectionDate) else { return }
        
        let triggerComponents = calendar.dateComponents([.weekday, .hour, .minute], from: notificationDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerComponents, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        //let timeInterval = TimeInterval(5)
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: "coleta_dia_\(weekday)", content: content, trigger: trigger)
                
                center.add(request) { error in
                    if let error = error {
                        print("Erro ao agendar notificação de calendário: \(error.localizedDescription)")
                    } else {
                        print("Notificação agendada com sucesso para os componentes: \(triggerComponents)")
                    }
                }
            }
    
    func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
