
import Combine
import SwiftUI

import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution
import LambdaspireLogging

extension ServiceLocator {
    static var `default`: ServiceLocator {
        
        let s: ServiceLocator = .init()
        
        s.register(HumanResources())
        s.register(EmployeeDatabase())
        
        let notificationService: NotificationService = .init(resolver: s, logger: PrintLogger())
        notificationService.register(handler: DefaultHandler.self)
        notificationService.register(handler: PerformanceRatingHandler.self)
        notificationService.register(handler: WrittenNoteHandler.self)
        
        notificationService.becomeMainNotificationResponder()
        
        s.register(notificationService)
        
        return s
    }
}

extension View {
    func with(_ appState: AppState, _ serviceLocator: ServiceLocator) -> some View {
        serviceLocator.register(appState)
        return self
            .environmentObject(appState)
            .environmentObject(serviceLocator)
    }
}

// So we can pass it along with @EnvironmentObject
extension ServiceLocator : ObservableObject { }
