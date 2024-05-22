
import SwiftUI
import LambdaspireSwiftNotifications

@main
struct Lambdaspire_SwiftNotifications_ExampleApp : App {
    
    @StateObject private var appState: AppState = .init()
    
    private let serviceLocator: BasicServiceLocator = .default
    
    var body: some Scene {
        WindowGroup {
            ContentView().with(appState, serviceLocator)
        }
    }
}
