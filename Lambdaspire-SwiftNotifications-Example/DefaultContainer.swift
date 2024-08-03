
import Combine
import SwiftUI

import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution
import LambdaspireLogging

extension Container {
    
    static var `default`: Container {
        
        let b: ContainerBuilder = .init()
        
        b.singleton { AppState() }
        
        b.singleton(HumanResources.init)
        b.singleton(EmployeeDatabase.init)
        
        b.singleton { NotificationService(scope: $0) }
        
        let container = b.build()
        
        let notificationService: NotificationService = container.resolve()
        notificationService.register(handler: DefaultHandler.self)
        notificationService.register(handler: PerformanceRatingHandler.self)
        notificationService.register(handler: WrittenNoteHandler.self)
        
        notificationService.becomeMainNotificationResponder()
        
        return container
    }
}

extension View {
    func with(_ container: Container) -> some View {
        self
            .environmentObject(container.resolve(AppState.self))
            .environmentObject(container)
    }
}

// So we can pass it along with @EnvironmentObject
extension Container : ObservableObject { }
